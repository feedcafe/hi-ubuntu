#!/bin/bash
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

root_path=.

err_msg=(
"uhid_write: Cannot write to uhid:Invalid argument"
"Error stopping Bluetooth profiles"
"read DIS failed"
"<getbuf: out of buffers>"
"H4: Unable to acquire buffer for incoming HCI message"
"Failed HID channel connection, status"
">>> com.android.bluetooth <<<"
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
"[USB]Disconnect interrupt  ="


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
	echo "#########################################################"
	# loop through err messages
	for i in "${err_msg[@]}"
	do
		grep -m 1 --color=auto -A 5 -B 5 "$i" -r $root_path/
		if [ $? -eq 0 ]; then
			echo "#########################################################"
		fi
	done
}

# bluedroid version
bluedroid_version()
{
	grep BDROID -m 1 -r $root_path/> $root_path/version.txt
	if [ $? -eq 0 ]; then
		cat $root_path/version.txt
	else
		echo "bluedroid version info not found, check md5sum"
		md5sum /system/lib/hw/bluetooth.default.so > $root_path/version.txt
	fi
}

blue_summary()
{
	echo "###################################################################"
	echo "#                                                                 #"
	echo "#                            bug summary                          #"
	echo "#                                                                 #"
	echo "###################################################################"

	tmp=`grep 'D/bt_hwcfg' -m 1 -rhc $root_path`
	if [ $? -eq 0 ]; then
		# logcat -v time
		chipset=`grep -m 1 'Chipset BCM43' -r $root_path/|cut -d " " -f 5,6`
	else
		# logcat -v threadtime
		chipset=`grep -m 1 'Chipset BCM43' -r $root_path/|cut -d " " -f 8,9,10`
	fi

	tmp=`grep 'E/bt-btu' -m 1 -rhc $root_path`
	if [ $? -eq 0 ]; then
		# logcat -v time
		version=`grep BDROID -r $root_path/ -m 1|cut -d " " -f 7,8,9,10,11`
	else
		# logcat -v threadtime
		version=`grep BDROID -r $root_path/ -m 1|cut -d " " -f 11,12,13,14,15`
	fi

	# echo "bdaddr: "
	# grep Address -m 1 `find . -name bt_config.xml`|cut -d ">" -f2
	# bdaddr=`echo $addr|cut -d "<" -f1`

	echo "## chipset      : $chipset"
	echo "## droid version: $version"
}

main()
{
	blue_summary

	auto_categorize_bugs
}

main
