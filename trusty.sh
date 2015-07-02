# This script helps me install all the needed deb packages in my daily life
# Current version is for Ubuntu 14.04 (Trusty Tahr)


############################ Basic Setup ###############################
sudo apt-get install ckermit automake -y
sudo apt-get install ctags
sudo apt-get install rar unrar tree
sudo apt-get install p7zip-full
sudo apt-get install ascii
sudo apt-get install dos2unix
sudo apt-get install goldendict -y

# grant access to /dev/ttyS0 (and friends), needs reboot
sudo adduser `whoami` dialout

sudo apt-get install leafpad
sudo apt-get install nautilus-open-terminal
sudo apt-get install vim-gnome -y

# lndir
sudo apt-get install xutils-dev
sudo apt-get install audacity -y

# lrzsz: free x/y/zmodem implementation
sudo apt-get install lrzsz

# ime
sudo apt-get install ibus ibus-pinyin ibus-table-wubi -y

sudo apt-get install screen

# feiQ
sudo apt-get install iptux
########################################################################



############################# MediaWiki ################################
sudo apt-get install tasksel -y
sudo tasksel install lamp-server
sudo apt-get install mediawiki -y
sudo apt-get install imagemagick mediawiki-math php5-gd -y
sudo sed -i 's/#Alias /Alias /g' /etc/mediawiki/apache.conf
sudo a2enconf mediawiki
sudo /etc/init.d/apache2 restart

sudo cp downloads/LocalSettings.php /etc/mediawiki/LocalSettings.php
########################################################################



############################ version control ###########################
sudo apt-get install git-core -y
sudo apt-get install git-email -y
sudo apt-get install subversion -y
########################################################################



########################### for lwqq ###################################
sudo apt-get install cmake -y
sudo apt-get install libpurple-dev -y
sudo apt-get install libcurl4-openssl-dev -y
sudo apt-get install libsqlite3-dev
sudo apt-get install libmozjs-17.0-dev -y
sudo apt-get install libev-dev -y
sudo apt-get install libmozjs185-dev -y
sudo apt-get install pidgin -y
########################################################################



######################### for usb dev ##################################
# libusb
sudo apt-get install libusb-dev

sudo apt-get install libusb-1.0-0-dev -y
sudo apt-get install python-usb
########################################################################



######################### for buildroot ################################
sudo apt-get install texinfo -y
########################################################################



############################ linux kernel dev ##########################
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
sudo sed -i 's/\/srv\/tftp/\/tftpboot/g' /etc/inetd.conf
sudo /etc/init.d/openbsd-inetd restart
sudo apt-get install openssh-server -y
########################################################################



############################ ftp server ###############################
sudo apt-get install vsftpd
sudo sed -i 's/anonymous_enable=NO/anonymous_enable=yes/g' /etc/vsftpd.conf
sudo service vsftpd restart
sudo apt-get install filezilla -y
########################################################################



############################# video program ############################
sudo apt-get install mplayer -y
sudo apt-get install smplayer -y
sudo apt-get install winff libavcodec-extra-54 -y
sudo apt-get install freetuxtv -y

# for program "Videos"
sudo apt-get install gstreamer1.0-plugins-bad-videoparsers -y
sudo apt-get install gstreamer1.0-plugins-bad-faad
sudo apt-get install libopencv-video2.4 -y
sudo apt-get install libmpg123-0


# for program "Videos" need to install the following packages to play
# windoss asf files
sudo apt-get install gstreamer1.0-plugins-ugly
sudo apt-get install gstreamer1.0-libav

# for avi file merge
# avimerge -i a.avi b.avi -o c.avi
sudo apt-get install transcode -y
########################################################################



############################# android stuff ############################
sudo apt-get install flex -y
sudo apt-get install bison -y
sudo apt-get install gperf


########################################################################



############################## Bluetooth ###############################
sudo apt-get install blueman
sudo apt-get install bluez-hcidump

# used for locking/unlocking ubuntu
sudo apt-get install blueproximity -y

# hcidump -w hcidump.cap
# wireshark hcidump.cap
sudo apt-get install wireshark -y
sudo apt-get install tshark
sudo apt-get install wireshark-dev -y

# bluez-5.3
sudo apt-get install libudev-dev
sudo apt-get install libical-dev
sudo apt-get install libreadline-dev -y

# sbc
sudo apt-get install libsndfile1-dev
sudo apt-get install libsbc-dev

# for wireshar build
sudo apt-get install libqt4-dev -y
sudo apt-get install libpcap-dev -y

sudo apt-get install libbluetooth-dev
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
./jdk-6u37-linux-x64.bin
sudo mv jdk1.6.0_37/ /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_37/bin/java 87
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_37/bin/javac 87
# sudo update-alternatives --config java
########################################################################



############################ dhcp server ###############################
sudo apt-get install dhcpd
sudo sed -i 's/interface\teth0/interface\teth1/g' /etc/udhcpd.conf
sudo sed -i 's/192.168.142/192.168.7/g' /etc/udhcpd.conf

# enable dhcp
sudo sed -i 's/DHCPD_ENABLED/\# DHCPD_ENABLED/g' /etc/default/udhcpd
sudo service udhcpd restart
########################################################################



############################# nfs server ###############################
sudo apt-get install nfs-kernel-server -y
sudo sed -i '$a/opt/nfsroot/       192.168.1.*(rw,sync,no_subtree_check)' /etc/exports
sudo service nfs-kernel-server restart
########################################################################



############################## misc ####################################
sudo apt-get install valgrind

sudo apt-get install flashplugin-installer

# cisco vpn
sudo apt-get install openconnect -y

#  e.g. errno 5
# EIO 5 Input/output error
sudo apt-get install errno -y

# android tools
sudo apt-get install android-tools-adb
sudo apt-get install android-tools-fastboot
sudo apt-get install phablet-tools -y
sudo apt-get install eclipse -y

# mkimage
sudo apt-get install u-boot-tools

# used for lookup LAN friends
# sudo arp-scan -I eth0 -l
sudo apt-get install arp-scan

sudo apt-get install iperf

# Synergy (mouse and keyboard sharing software) for Windows,
# Mac OS X and Linux
sudo apt-get install synergy

# for building webqq-core
# mvn clean install
sudo apt-get install maven -y

# sbc decode/encode
# sbcdec -f test.pcm test.sbc
sudo apt-get install sbc-tools
########################################################################



############################## wordpress ###############################
sudo apt-get install wordpress -y
sudo apt-get install mysql-server -y

# example 1
sudo ln -s /usr/share/wordpress /var/www/wordpress
sudo chown -R www-data /usr/share/wordpress

# example 2
sudo ln -s /opt/fdbai/wordpress/linuxabc /var/www/linuxabc
sudo chown -R www-data /opt/fdbai/wordpress/linuxabc

sudo sed -i 's/Listen 80/Listen 8787/g' /etc/apache2/ports.conf

sudo service apache2 restart

sudo apt-get install phpmyadmin -y
sudo ln -s /usr/share/phpmyadmin  /var/www/
########################################################################
