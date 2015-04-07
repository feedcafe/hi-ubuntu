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
"btif_storage_hisense_rc_record_valid: we found a Hisense RC but without pid"
"L2CAP got BLE scanner conn_comp in bad state"
"Error stopping Bluetooth profiles"
"read DIS failed"
"<getbuf: out of buffers>"
"H4: Unable to acquire buffer for incoming HCI message"
"preload_wait_timeout (retried"
"smp_rsp_timeout state"
"btif_dm_upstreams_evt An Corrupted Hisense RC record is found, remove it"
"Failed HID channel connection, status"
"No such connection need to be cancelled"
"bta_gattc_process_api_open Failed, unknown client_i"
"getbuf: out of buffers"
"btif_storage_is_hisense_rc: This is not an Hisense RC, name is different"
"name: BTU  >>> com.android.bluetooth <<<"
"/system/lib/hw/bluetooth.default.so ("
"GKI_add_to_timer_list(): timer list corrupted!"
"ANR in com.android.bluetooth"
"(BTM_ReadInquiryRspTxPower"
"(BTM_VendorSpecificCommand+"
"Error enabling Bluetooth"
"Error disabling Bluetooth"
"a2dp ack : A2DP_CTRL_CMD_START, status 1"
"btif_dm_search_services_evt Remote Service SDP failed. Trigger REMOVE_BOND"
"can only be reconnected from device side"
"btif_dm_start_discovery Pairing in progress. Cannot perform inquiry"
"BTIF_GATT_OBSERVE_EVT removed pairing if we found a hisense RC that paired"
"bta_hh_le_write_rpt: no matching report"
"uhid_write: Cannot write to uhid:Invalid argument"
"bta_hh_co_send_hid_info: Error: failed to send DSCP, result ="
"bta_gattc_deregister Deregister Failed unknown client if"
"WARNING : BTU HCI(id=0) command timeout. opcode=0x"
"SDP - Rcvd conn cnf with error"
"No active a2dp connection"
"In the given service, can not find matching record"
"device descriptor read/64, error -110"
"No profiles. Maybe we will connect later"
"ERROR : timer_thread: tick delayed > 5 slots"
"start_audio_datapath: audiopath start failed"
)

auto_categorize_bugs()
{
	echo `date +%F-%H:%M:%S` > /tmp/summary.txt
	echo "#########################################################" >> /tmp/summary.txt
	# loop through err messages
	for i in "${err_msg[@]}"
	do
		grep -A 5 -B 5 "$i" -r $root_path/ >> /tmp/summary.txt
		if [ $? -eq 0 ]; then
			echo "#########################################################" >> /tmp/summary.txt
		fi
	done

	lines=`wc -l /tmp/summary.txt|cut -d " " -f1`
	if [ $lines -eq 1 ]; then
		echo "new case, need to do scene investigation"
	else
		cat /tmp/summary.txt
	fi

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

	chipset=`grep 'Chipset BCM43' -r $root_path/|cut -d " " -f 8,9,10`
	version=`grep BDROID -r $root_path/ -m 1|cut -d " " -f 11,12,13,14,15`

	echo "bdaddr: "
	#grep Address -m 1 `find . -name bt_config.xml`|cut -d ">" -f2
	#bdaddr=`echo $addr|cut -d "<" -f1`

	echo "## chipset      : $chipset"
	echo "## droid version: $version"
}

main()
{
	blue_summary

	auto_categorize_bugs
}

main
