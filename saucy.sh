# This script helps me install all the needed deb packages in my daily life
# Current version is for Ubuntu 13.10 (Saucy Salamander)


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
sudo apt-get install audacity -y

# lrzsz: free x/y/zmodem implementation
sudo apt-get install lrzsz

# ime
sudo apt-get install ibus ibus-pinyin ibus-table-wubi -y

sudo apt-get install screen
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
sudo apt-get install vlc -y
sudo apt-get install winff libavcodec-extra-53 -y
########################################################################



############################# android stuff ############################
sudo apt-get install g++ -y
sudo apt-get install bison flex gperf -y
sudo apt-get install zlib1g-dev libssl-dev -y
sudo apt-get install libglib2.0-dev -y
sudo apt-get install gcc-multilib -y
sudo apt-get install xsltproc
sudo apt-get install libxml2-utils
########################################################################



############################## FreetuxTV ###############################
sudo apt-get install intltool libcurl4-openssl-dev -y
sudo apt-get install libvlc-dev libgtk2.0-dev libdbus-glib-1-dev -y
sudo apt-get install libnotify-dev libsqlite3-dev -y
########################################################################



############################## Bluetooth ###############################
sudo apt-get install blueman
sudo apt-get install bluez-hcidump

# used for locking/unlocking ubuntu
sudo apt-get install blueproximity

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


############################## sun jdk #################################
./jdk-6u26-linux-x64.bin
sudo mv jdk1.6.0_26/ /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_26/bin/java 87
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_26/bin/javac 87
# sudo update-alternatives --config java
########################################################################


############################## usb #####################################
# libusb
sudo apt-get install libusb-dev
sudo apt-get install libusb-1.0-0-dev -y
sudo apt-get install libtool -y
########################################################################



############################## misc ####################################
sudo apt-get install u-boot-tools
sudo apt-get install mtd-utils
sudo apt-get install gawk
sudo apt-get install bsdgames	# rot13
sudo apt-get install lzop
sudo apt-get install uuid-dev
sudo apt-get install inotify-tools -y

sudo apt-get install manpages-posix-dev -y

# usbboot
sudo apt-get install libconfuse0 libconfuse-dev -y

# openocd
sudo apt-get install openocd -y

sudo apt-get install gcc-arm-linux-gnueabi -y

# internet

# nfs server
sudo apt-get install nfs-kernel-server -y

sudo apt-get install valgrind

sudo apt-get install gcc-arm-linux-gnueabi -y

sudo apt-get install apt-file -y

# cisco vpn
sudo apt-get install openconnect -y

# sbc decode/encode
# sbcdec -f test.pcm test.sbc
sudo apt-get install sbc-tools
########################################################################



############################## wordpress ###############################
sudo apt-get install wordpress -y
sudo apt-get install mysql-server -y
sudo ln -s /usr/share/wordpress /var/www/wordpress
sudo chown -R www-data /usr/share/wordpress
#sudo bash /usr/share/doc/wordpress/examples/setup-mysql -n wordpress localhost

sudo sed -i 's/Listen 80/Listen 8787/g' /etc/apache2/ports.conf

sudo service apache2 restart
phddns -c /etc/phlinux.conf -d
########################################################################



############################## linaro-media-create #####################
sudo apt-get install bzr -y
sudo apt-get install python-parted
sudo apt-get install btrfs-tools
sudo apt-get install python-yaml
########################################################################



# sudo apt-cache policy ia32-libs
