# This script helps me install all the needed deb packages in my daily life
# Current version is for Ubuntu 12.04 (Precise Pangolin)


############################ Basic Setup ###############################
sudo apt-get install ckermit automake -y
sudo apt-get install ctags
sudo apt-get install chmsee -y
sudo apt-get install rar unrar tree -y
sudo apt-get install p7zip-full
sudo apt-get install ascii
sudo apt-get install dos2unix
sudo apt-get install bless	# a hex editor
sudo apt-get install gconf-editor -y	# ubuntu gnome config editor
sudo apt-get install goldendict -y
sudo apt-get install goldendict-wordnet
sudo apt-get install stardict -y

# grant access to /dev/ttyS0 (and friends), needs reboot
sudo adduser `whoami` dialout

sudo apt-get install leafpad -y
sudo apt-get install nautilus-open-terminal -y
sudo apt-get install vim-gnome -y

# lndir
sudo apt-get install xutils-dev

# ime
sudo apt-get install ibus ibus-pinyin ibus-table-wubi -y

# to fix evince parsing Chinese issue
sudo apt-get install poppler-data

# Enable Always use location entry in Ubuntu 12.04
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
########################################################################



############################ version control ###########################
sudo apt-get install git-core -y
sudo apt-get install git-email -y
sudo apt-get install gitk -y
sudo apt-get install subversion -y
########################################################################



############################# BuildYourOwnKernel #######################
# ubuntu linux source
sudo apt-get source linux-image-$(uname -r)

# build environment
sudo apt-get build-dep linux-image-$(uname -r) -y
########################################################################



############################ linux kernel dev ##########################
# make xconfig needs qt
sudo apt-get install libqt4-dev -y

# make menuconfig need this
sudo apt-get install libncurses5-dev -y

# a front end reader of trace-cmd output
sudo apt-get install kernelshark -y
########################################################################



############################ tftp server ###############################
sudo apt-get install tftp tftpd openbsd-inetd -y
sudo mkdir /tftpboot
sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot
# need to edit /etc/inetd.conf 
# sudo /etc/init.d/openbsd-inetd restart
sudo apt-get install openssh-server -y
########################################################################



############################ dhcp server ###############################
sudo apt-get install dhcpd
# You may want to change the start and end of the IP lease block by
# edit the following config file:
# /etc/udhcpd.conf
#
# default: 192.168.0.20 ~ 192.168.0.254
#
# sudo vi /etc/default/udhcpd
# need to comment the following line
# DHCPD_ENABLED="no"
sudo service udhcpd restart
########################################################################



############################# video program ############################
sudo apt-get install mplayer -y
sudo apt-get install smplayer -y

sudo apt-get install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad -y
# for asf files
sudo apt-get install gstreamer0.10-plugins-ugly -y

# Download youtube video
sudo apt-get install youtube-dl
# update to latest version
sudo youtube-dl -U
########################################################################



############################# android stuff ############################
sudo apt-get install g++ -y
sudo apt-get install bison flex gperf -y
sudo apt-get install zlib1g-dev libssl-dev -y
sudo apt-get install libglib2.0-dev -y

# fix build ics on precise
# sudo apt-get install gcc-4.4 g++-4.4 -y
# sudo ln -fs /usr/bin/gcc-4.4 /usr/bin/gcc
# sudo ln -fs /usr/bin/g++-4.4 /usr/bin/g++
########################################################################



############################## FreetuxTV ###############################
sudo apt-get install intltool libcurl4-openssl-dev -y
sudo apt-get install libvlc-dev libgtk2.0-dev libdbus-glib-1-dev -y
sudo apt-get install libnotify-dev libsqlite3-dev -y
########################################################################



############################## Bluetooth ###############################
# PRemoteDroid-Server needs libbluetooth
sudo apt-get install libbluetooth-dev -y

sudo apt-get install blueman
sudo apt-get install bluez-hcidump

# hcidump -w hcidump.cap
# wireshark hcidump.cap
sudo apt-get install wireshark -y

# bluez-5.3
sudo apt-get install libudev-dev -y
sudo apt-get install libical-dev
sudo apt-get install libreadline-dev -y
########################################################################



############################## winmail.dat #############################
# fix thunderbird winmail.dat issue
sudo apt-get install tnef

# extract attachment
# tnef winmail.dat

sudo apt-get install convmv

# convert filename encoding
# convmv -f gbk -t utf8 --notest *.docx

convmv -r -f utf8 -t iso88591 *.mp3 --notest --nosmart && convmv -r -f gbk -t utf8 *.mp3 --notest --nosmart
########################################################################



############################## sun jdk #################################
sudo ./jdk-6u32-linux-i586.bin
sudo mv jdk1.6.0_32/ /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_32/bin/java 87
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_32/bin/javac 87
# sudo update-alternatives --config java
########################################################################



############################## usb #####################################
# libusb
sudo apt-get install libusb-dev
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install libtool -y
########################################################################



############################## misc ####################################
sudo apt-get install uboot-mkimage -y
sudo apt-get install mtd-utils -y
sudo apt-get install gawk -y
sudo apt-get install procmail -y
sudo apt-get install lzop -y

sudo apt-get install uuid-dev

# openocd
sudo apt-get install openocd -y

# file /bin/sh
# sudo ln -fs /bin/bash /bin/sh

# libgmp.so.3 Cannot open shared object file
sudo apt-get install libgmp3c2

# get repo
sudo apt-get install curl

sudo apt-get install gcc-arm-linux-gnueabi -y


# beyound compare
sudo gdebi /opt/software/ubuntu/bcompare/bcompare-3.3.5.15075_i386.deb

# internet

# nfs server
sudo apt-get install nfs-kernel-server -y --force-yes

# Chromium, fast and best browser
# sudo apt-get install chromium-browser -y

# file transfer(support SSH)
sudo apt-get install filezilla -y

sudo apt-get install adobe-flashplugin

sudo apt-get install skype -y

# Teredo IPv6 tunneling software for Ubuntu
sudo apt-get install miredo


# Schedule alarms/reminders easily from an indicator
# sudo apt-get install indicator-remindor


# apt-cache search linux-headers-$(uname -r)
# sudo apt-get install linux-headers-$(uname -r)


# weather indicator
# sudo apt-get install indicator-weather -y

# my-weather-indicator
# sudo add-apt-repository ppa:atareao/atareao
# sudo apt-get update
# sudo apt-get install my-weather-indicator
########################################################################



############################## wordpress ###############################
sudo apt-get install wordpress -y
sudo apt-get install mysql-server -y
sudo ln -s /usr/share/wordpress /var/www/wordpress
sudo chown -R www-data /usr/share/wordpress
sudo bash /usr/share/doc/wordpress/examples/setup-mysql -n wordpress localhost
sudo service apache2 restart
########################################################################
