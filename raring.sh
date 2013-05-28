# This script helps me install all the needed deb packages in my daily life
# Current version is for Ubuntu 13.04 (Raring Ringtail)


############################ Basic Setup ###############################
sudo apt-get install ckermit automake -y
sudo apt-get install ctags
sudo apt-get install rar unrar tree
sudo apt-get install p7zip-full
sudo apt-get install ascii
sudo apt-get install dos2unix
sudo apt-get install bless -y	# a hex editor
sudo apt-get install goldendict -y

# grant access to /dev/ttyS0 (and friends), needs reboot
sudo adduser `whoami` dialout

sudo apt-get install leafpad
sudo apt-get install nautilus-open-terminal
sudo apt-get install vim-gnome -y

# lndir
sudo apt-get install xutils-dev

# lrzsz: free x/y/zmodem implementation
sudo apt-get install lrzsz

# ime
sudo apt-get install ibus ibus-pinyin ibus-table-wubi -y

# pdf reader
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get -y install acroread

# rcconf is Debian runlevel configuration tool. Rcconf allows you to control
# which services are started when the system boots up or reboots. It displays
# a menu of all the services which could be started at boot. The ones that
# are configured to do so are marked and you can toggle individual services
# on and off.
sudo apt-get install rcconf

# another tool for managing services
sudo apt-get install sysv-rc-conf -y

########################################################################



############################ version control ###########################
sudo apt-get install git-core -y
sudo apt-get install git-email -y
sudo apt-get install subversion -y
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



############################# video program ############################
sudo apt-get install mplayer -y
sudo apt-get install smplayer -y
########################################################################



############################# android stuff ############################
sudo apt-get install g++ -y
sudo apt-get install bison flex gperf -y
sudo apt-get install zlib1g-dev libssl-dev -y
sudo apt-get install libglib2.0-dev -y
########################################################################



############################## FreetuxTV ###############################
sudo apt-get install intltool libcurl4-openssl-dev -y
sudo apt-get install libvlc-dev libgtk2.0-dev libdbus-glib-1-dev -y
sudo apt-get install libnotify-dev libsqlite3-dev -y
########################################################################



############################## Bluetooth ###############################
sudo apt-get install blueman
sudo apt-get install bluez-hcidump

# hcidump -w hcidump.cap
# wireshark hcidump.cap
sudo apt-get install wireshark -y

# bluez-5.3
sudo apt-get install libudev-dev
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


############################## usb #####################################
# libusb
sudo apt-get install libusb-dev
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install libtool -y
########################################################################



############################## misc ####################################
sudo apt-get install uboot-mkimage -y
sudo apt-get install mtd-utils
sudo apt-get install gawk
sudo apt-get install bsdgames	# rot13
sudo apt-get install lzop

sudo apt-get install uuid-dev

# usbboot
sudo apt-get install libconfuse0 libconfuse-dev -y

# openocd
sudo apt-get install openocd -y

sudo apt-get install gcc-arm-linux-gnueabi -y

# internet

# nfs server
sudo apt-get install nfs-kernel-server -y

# weather indicator
sudo apt-get install indicator-china-weather -y
########################################################################



############################## wordpress ###############################
sudo apt-get install wordpress -y
sudo apt-get install mysql-server -y
sudo ln -s /usr/share/wordpress /var/www/wordpress
sudo chown -R www-data /usr/share/wordpress
#sudo bash /usr/share/doc/wordpress/examples/setup-mysql -n wordpress localhost

sudo sed -i 's/Listen 80/Listen 8787/g' /etc/apache2/ports.conf

sudo service apache2 restart
########################################################################
