#!/system/bin/sh
#
# Copyright (C) 2012, Hisense
#     Fudong <baifudong@hisense.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

root_path="/data"
bluelog_path="$root_path/bluelog"
log_path="$bluelog_path/"`date +%F-%H%M`
bluedroid_path="/data/misc/bluedroid"
bt_stack="/etc/bluetooth/bt_stack.conf"
mount_point="/storage/usbdisk"

screencap_path="$log_path/screencap/"
plain_text_mail="false"

# usb disk mount point detect
usb_detect()
{
	usb=`mount | grep usbdisk`

	if [ $? -eq 1 ]; then
		echo -e "\033[41;37musb disk not detected\033[0m"
		return 1
	else
		echo -e "\033[44;37musb disk detected\033[0m"
		mount_point=`echo $usb|busybox cut -d " " -f2`
		echo $mount_point
		return 0
	fi
}

# enable btsnoop for hci debug
enable_btsnoop()
{
	mount -o remount,rw /system
	busybox sed -i 's/BtSnoopLogOutput=false/BtSnoopLogOutput=true/g' $bt_stack
	busybox sed -i 's/BtSnoopFileName=\/sdcard\/btsnoop_hci.log/BtSnoopFileName=\/data\/misc\/bluedroid\/btsnoop_hci.cfa/g' $bt_stack

	# dump more log
	busybox sed -i 's/TRC_BTM=2/TRC_BTM=5/g' $bt_stack
	busybox sed -i 's/TRC_HCI=2/TRC_HCI=5/g' $bt_stack
	busybox sed -i 's/TRC_L2CAP=2/TRC_L2CAP=5/g' $bt_stack
	busybox sed -i 's/TRC_HIDH=2/TRC_HIDH=5/g' $bt_stack
	busybox sed -i 's/TRC_RFCOMM=2/TRC_RFCOMM=5/g' $bt_stack
	busybox sed -i 's/TRC_SDP=2/TRC_SDP=5/g' $bt_stack
	busybox sed -i 's/TRC_GATT=2/TRC_GATT=5/g' $bt_stack
	busybox sed -i 's/TRC_SMP=2/TRC_SMP=5/g' $bt_stack
	busybox sed -i 's/TRC_BTAPP=2/TRC_BTAPP=5/g' $bt_stack
	busybox sed -i 's/TRC_BTIF=2/TRC_BTIF=5/g' $bt_stack
	busybox sed -i 's/TRC_PROTOCOL=0/TRC_PROTOCOL=5/g' $bt_stack
}

err_msg=(
"uhid_write: Cannot write to uhid:Invalid argument"
"Error stopping Bluetooth profiles"
"read DIS failed"
"<getbuf: out of buffers>"
"H4: Unable to acquire buffer for incoming HCI message"
"Failed HID channel connection, status"
"name: BTU  >>> com.android.bluetooth <<<"
"name: BTIF  >>> com.android.bluetooth <<<"
"Process com.android.bluetooth (pid "
"ANR in com.android.bluetooth"
"(BTM_ReadInquiryRspTxPower"
"(BTM_VendorSpecificCommand+"
"Error enabling Bluetooth"
"Error disabling Bluetooth"
"bta_hh_co_send_hid_info: Error: failed to send DSCP, result ="
"WARNING : BTU HCI(id=0) command timeout. opcode=0x"
"Num consecutive HCI Cmd tout =2 Restarting BT process"
"SDP - Rcvd conn cnf with error"
"/system/lib/hw/bluetooth.default.so ("
"Failed HID channel connection, status: 4"
"frame_period_callback frame_period:65535"
"No Bluetooth Service (Bluetooth Hardware Not Present)"
"Reason : 8 (0x08)"
"why this issue happen"
"btif_dm_search_services_evt Remote Service SDP failed. Trigger REMOVE_BOND"
"can only be reconnected from device side"
"btif_dm_start_discovery Pairing in progress. Cannot perform inquiry"
"btif_dm_upstreams_evt An Corrupted Hisense RC record is found, remove it"
"No active a2dp connection"
"preload_wait_timeout (retried"
"Timeout will setting scan mode..Continuing with disable"
"GKI_add_to_timer_list(): timer list corrupted!"
"No such connection need to be cancelled"
"L2CAP got BLE scanner conn_comp in bad state"


"btif_storage_hisense_rc_record_valid: we found a Hisense RC but without pid"
"bta_gattc_process_api_open Failed, unknown client_i"
"btif_storage_is_hisense_rc: This is not an Hisense RC, name is different"
"a2dp ack : A2DP_CTRL_CMD_START, status 1"
"BTIF_GATT_OBSERVE_EVT removed pairing if we found a hisense RC that paired"
"bta_gattc_deregister Deregister Failed unknown client if"


"########### the following messages are not related to bluedroid ###########"
"device descriptor read/64, error -110"
"Txctl wait timed out"
)

auto_categorize_bugs()
{
	echo `date +%F-%H:%M:%S` > $log_path/summary.txt
	# loop through err messages
	for i in "${err_msg[@]}"
	do
		grep -m 1 "$i" $root_path/log.txt* >> $log_path/summary.txt
	done

	lines=`busybox wc -l $log_path/summary.txt|busybox cut -d " " -f1`
	if [ $lines -eq 1 ]; then
		echo -e "\033[44;37m############################################################\033[0m"
		echo -e "\033[44;37m######## new case, need to do scene investigation ##########\033[0m"
		echo -e "\033[44;37m############################################################\033[0m"
	else
		cat $log_path/summary.txt
	fi
}

# check bluedroid log level
# FIXME [: 2: unexpected operator/operand
check_bluedroid_log()
{
	log_level=`busybox grep 'TRC_BTIF=2' $bt_stack|busybox cut -d "=" -f 2`
	if [ $log_level -eq 2 ]; then
		while true; do
			echo "Do you wish to enable bluedroid log? [Yes/No], need reboot"
			read yesno
			case $yesno in
				[Yy]* ) enable_btsnoop;
					remove_outdated_logs;
					reboot;;
				[Nn]* ) enable_btsnoop;
					break;;
				* ) echo "Please answer yes or no.";;
			esac
		done
	else
		echo "bt stack log level: 5"
	fi
}

# bluedroid version
bluedroid_version()
{
	grep BDROID -m 1 $root_path/log.txt*> $log_path/version.txt
	if [ $? -eq 0 ]; then
		cat $log_path/version.txt
	else
		echo "bluedroid version info not found, check md5sum"
		busybox md5sum /system/lib/hw/bluetooth.default.so > $log_path/version.txt
	fi
}

# try to enable bluetooth to see if it working
enable_bluetooth()
{
	am start -n com.android.settings/.bluetooth.BluetoothSettings
	input touchscreen tap 615 366
}

check_bluetooth()
{
	# FIXME
	# is there a better way to get screenshot of bluetooth settings
	am start com.android.settings

	# send keyevent KEYCODE_DOWN
	input keyevent 20

	# send keyevent KEYCODE_RIGHT
	input keyevent 22

	# send keyevent KEYCODE_DOWN 5 times
	input keyevent 20
	input keyevent 20
	input keyevent 20
	input keyevent 20
	input keyevent 20

	# send keyevent KEYCODE_ENTER
	input keyevent 66

	get_screenshot
}

# get paired devices
paired_devices()
{
	# TODO
}

check_wifi()
{
	# TODO
}

# get current screenshot
get_screenshot()
{
	if [ ! -d "$screencap_path" ]; then
		mkdir -p $screencap_path
	fi
	screencap "$screencap_path/bluetooth-`date +%F-%H-%M-%S`.png"
}

get_ipaddr()
{
	netcfg |grep eth0|busybox cut -d " " -f38 > $log_path/ipaddr.txt
}

get_eth_macaddr()
{
	# mac address
	netcfg |grep eth0|busybox cut -d " " -f41 > $log_path/macaddr.txt
}

# check internet access
check_internet()
{
	ping -c 2 g.cn
	if [ $? -eq 0 ]
	then
		echo "internet available"
		return 0
	else [ $? -eq 2 ]
		echo "ping: unknown host g.cn"
		return 1
	fi
}

blue_getprop()
{
	echo "product name: " `getprop ro.product.name`
	echo "build date: " `getprop ro.build.date`
	getprop > $log_path/getprop.txt
}

# select mail server
setup_mail_server()
{
	if [ $1 = "yeah" ]; then
		mailserver="123.58.177.132"	# smtp.yeah.net
		mailfrom="googletv@yeah.net"
		username="googletv"
		passwd="qwerty123"
	elif [ $1 = "mail" ]; then
		mailserver="74.208.5.15"	# mail.com
		mailfrom="fudong@mail.com"
		username="fudong@mail.com"
		passwd="qwerty123"
	elif [ $1 = "hisense" ]; then
		mailserver="mail.hisense.com"	# mail.hisense.com
		mailfrom="baifudong@mail.hisense.com"
		username="baifudong@mail.hisense.com"
		passwd="abc"

	fi
	echo "mail server $1 selected"
}

# check if the attachment exceeds the limit size of mail server
check_attachment()
{
	# busybox stat -c "%s" bluelog.tar.bz2
	# if attachment larger than 5 MB, script will send plain text mail
	size=`busybox du -k $root_path/bluelog.tar.bz2|busybox awk '{print $1}'`
	max_size=7*1024

	if [[ $size -lt $max_size ]]; then
		echo "attachment not exceeds limit size (7 MB)"
		plain_text_mail="false"
	else
		echo "attachment too large, send plain text mail"
		plain_text_mail="true"
	fi
}

# send plain text message using busybox sendmail applet
busybox_sendmail()
{
	echo "###################################################################"
	echo "#                                                                 #"
	echo "#                    send mail to feature owner                   #"
	echo "#                  using busybox (swiss army knife)               #"
	echo "#                                                                 #"
	echo "###################################################################"

	# need a new line between subject and mail body
	echo "Subject: $subject" > $bluelog_path/mail.txt
	echo "" >> $bluelog_path/mail.txt
	cat $bluelog_path/getprop.txt >> $bluelog_path/mail.txt
	cat $bluelog_path/mail.txt | busybox sendmail -S $mailserver \
		-f $mailfrom -au"$username" -ap"$passwd" $mailto
}

# send plain text message using busybox sendmail applet
busybox_sendmail_with_attachment()
{
	echo "###################################################################"
	echo "#                                                                 #"
	echo "#                   send mail to feature owner                    #"
	echo "#               using busybox makemime and sendmail               #"
	echo "#                                                                 #"
	echo "###################################################################"

	busybox makemime -a "Subject: $subject" \
		-o $root_path/attachment $root_path/bluelog.tar.bz2
	cat $root_path/attachment | busybox sendmail \
		-S $mailserver -f $mailfrom \
		-au"$username" -ap"$passwd" $mailto
}

blue_common_log()
{
	# kernel log
	echo `date +%F-%H:%M:%S` > $log_path/dmesg.txt
	dmesg >> $log_path/dmesg.txt

	busybox lsusb > $log_path/lsusb.txt

	debugfs=`mount | grep debugfs`
	if [ $? -eq 1 ]; then
		echo "debugfs not mounted, mounting debugfs ..."
		mount -t debugfs none /sys/kernel/debug
	else
		echo "debugfs already mounted"
	fi

	cat /sys/kernel/debug/usb/devices >> $log_path/lsusb.txt

	lsmod > $log_path/lsmod.txt

	bluedroid_version

	# logcat
	cp $root_path/log.txt* $log_path/

	# btsnoop and bt_config
	mkdir $log_path/bluedroid/
	cp $bluedroid_path/* $log_path/bluedroid/

	# top
	/system/bin/top -n 1 -d 1 -m 30 -t > $log_path/top.txt

	# ps
	ps |grep bluetooth > $log_path/ps.txt

	procrank > $log_path/procrank.txt

	# traces
	if [ -d "$root_path/anr" ]; then
		mkdir $log_path/anr
		cp $root_path/anr/* $log_path/anr/
	fi

	if [ -d "$root_path/tombstones" ]; then
		mkdir $log_path/tombstones
		cp $root_path/tombstones/* $log_path/tombstones
	fi
}

# NOTE: keep time-consuming and unimportant work in the last step
blue_post_process()
{
	# get device info
	blue_getprop

	# get mac address of eth0
	get_eth_macaddr

	# get paired device list
	paired_devices

	# pack all bluetooth related logs
	cd $root_path
	echo "Compressing logs ..."
	rm -fr bluelog.tar*
	busybox tar cvf $root_path/bluelog.tar $bluelog_path
	busybox bzip2 -zvv bluelog.tar

	# usb disk detected, copy to usb
	usb_detect
	if [ $? -eq 0 ]; then
		cp $root_path/bluelog.tar.bz2 $mount_point/
		sync
		busybox md5sum $root_path/bluelog.tar.bz2
		busybox md5sum $mount_point/bluelog.tar.bz2

		# notfiy user that copy has completed
		am start -a android.intent.action.VIEW  -t 'audio/ogg' \
			-d 'file:///system/media/audio/notifications/TaDa.ogg'

		echo -e "\033[44;37mdone, please remove your usb disk\033[0m"
		rm -fr $root_path/bluelog*
		exit
	fi

	# see if we can send mail to feature owner
	check_internet
	if [ $? -eq 1 ]
	then
		exit
	fi

	setup_mail_server hisense

	mailto="baifudong@mail.hisense.com"
	someone="Fudong"
	product=`getprop ro.product.name`
	subject="$someone's $product has issue"

	check_attachment

	# send mail to feature owner
	if [ $1 = "true" ]; then
		echo "sending plain text mail"
		busybox_sendmail
	else
		echo "sending mail with attachment"
		busybox_sendmail_with_attachment
	fi
}

remove_outdated_logs()
{
	# remove outdated logs
	rm $root_path/log.txt*
	rm -fr $root_path/anr/
	rm -fr $root_path/tombstones/
	rm -fr $root_path/bluelog*
}

blue_prepare()
{
	# set timezone
	setprop persist.sys.timezone Asia/Shanghai

	# make sure directory exist
	if [ ! -d "$log_path" ]; then
		mkdir -p $log_path
	fi
	echo "bluetooth dir: $log_path"
	echo "screencap dir: $screencap_path"

	check_bluedroid_log
}

blue_summary()
{
	echo "###################################################################"
	echo "#                                                                 #"
	echo "#                            bug summary                          #"
	echo "#                                                                 #"
	echo "###################################################################"

	product_name=`getprop ro.build.product.name`
	build_date=`getprop ro.build.date`
	chipset=`grep 'Chipset BCM43' $root_path/log.txt*|busybox cut -d " " -f 9,10`
	version=`grep BDROID $root_path/log.txt* -m 1|busybox cut -d " " -f 11,12,13,14,15`

	addr=`busybox grep Address $bluedroid_path/bt_config.xml|busybox cut -d ">" -f2`
	bdaddr=`echo $addr|busybox cut -d "<" -f1`

	echo -e "\033[44;37m## product name \033[0m: $product_name"
	echo -e "\033[44;37m## build date   \033[0m: $build_date"
	echo -e "\033[44;37m## bdaddr       \033[0m: $bdaddr"
	echo -e "\033[44;37m## chipset      \033[0m: $chipset"
	echo -e "\033[44;37m## droid version\033[0m: $version"
}

main()
{
	blue_prepare

	# copy logs including logcat, dmesg etc
	blue_common_log

	# capture screen of bluetooth settings
	# check_bluetooth

	blue_summary

	auto_categorize_bugs

	blue_post_process plain_text_mail
}

main
