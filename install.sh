# This script helps me install all the needed deb packages in my daily life
# Current version is for Ubuntu 12.04 (Precise Pangolin)

# version control
sudo apt-get install git-core -y
sudo apt-get install git-email -y
sudo apt-get install subversion -y


# linux kernel dev

# make xconfig needs qt
sudo apt-get install libqt4-dev -y

# make menuconfig need this
sudo apt-get install libncurses5-dev -y


sudo apt-get install lzop -y


# common utils
sudo apt-get install ckermit automake -y
sudo apt-get install ctags
sudo apt-get install chmsee -y
sudo apt-get install rar unrar tree -y
sudo apt-get install p7zip-full

# beyound compare
sudo gdebi /opt/software/ubuntu/bcompare/bcompare-3.3.5.15075_i386.deb


# android stuff
sudo apt-get install g++ -y
sudo apt-get install bison flex gperf -y
sudo apt-get install zlib1g-dev libssl-dev -y
sudo apt-get install libglib2.0-dev -y

# fix build ics on precise
sudo apt-get install gcc-4.4 -y
sudo rm /usr/bin/gcc
sudo ln -s /usr/bin/gcc-4.4 /usr/bin/gcc

sudo apt-get install g++-4.4 -y
sudo rm /usr/bin/g++
sudo ln -s /usr/bin/g++-4.4 /usr/bin/g++

file /bin/sh
sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh

# sun jdk
sudo ./jdk-6u32-linux-i586.bin
sudo mv jdk1.6.0_32/ /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_32/bin/java 87
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_32/bin/javac 87
# sudo update-alternatives --config java

# grant access to /dev/ttyS0, needs reboot
sudo adduser fdbai dialout


# libgmp.so.3 Cannot open shared object file
sudo apt-get install libgmp3c2

# get repo
sudo apt-get install curl

# lndir
sudo apt-get install xutils-dev

# libusb
sudo apt-get install libusb-dev
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install libtool -y


# openocd
sudo apt-get install openocd -y


# other
sudo apt-get install uboot-mkimage -y
sudo apt-get install leafpad -y
sudo apt-get install nautilus-open-terminal -y

sudo apt-get install vim-gnome -y

sudo apt-get install gawk -y
sudo apt-get install procmail -y

sudo apt-get install uuid-dev


# qtqq
sudo apt-get install libnotify-dev -y
sudo apt-get install libgtk2.0-dev -y
sudo apt-get install cmake



# internet
sudo apt-get install openfetion -y

# Chromium, fast and best browser
sudo apt-get install chromium-browser -y

# file transfer(support SSH)
sudo apt-get install filezilla -y

sudo apt-get install adobe-flashplugin



# tftp
sudo apt-get install tftp tftpd openbsd-inetd -y
sudo mkdir /tftpboot
sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot
# need to edit /etc/inetd.conf 
# sudo /etc/init.d/openbsd-inetd restart
sudo apt-get install openssh-server -y

# dhcp server
sudo apt-get install dhcpd
# sudo vi /etc/default/udhcpd
# need to comment the following line
# DHCPD_ENABLED="no"
sudo service udhcpd restart


# video
sudo apt-get install mplayer -y

sudo apt-get install smplayer -y

sudo apt-get install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad -y
# for asf files
sudo apt-get install gstreamer0.10-plugins-ugly -y


# to fix evince parsing Chinese issue
sudo apt-get install poppler-data


# Enable Always use location entry in Ubuntu 12.04
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

apt-cache search linux-headers-$(uname -r)
sudo apt-get install linux-headers-$(uname -r)

# wordpress
sudo apt-get install wordpress -y
sudo apt-get install mysql-server -y
sudo ln -s /usr/share/wordpress /var/www/wordpress
sudo chown -R www-data /usr/share/wordpress
sudo bash /usr/share/doc/wordpress/examples/setup-mysql -n wordpress localhost
sudo service apache2 restart
