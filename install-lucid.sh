sudo add-apt-repository "deb file:///cdrom/ lucid main"

# /etc/apt/sources.list
# for sun-java6-jdk
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu maverick partner"

# for openfetion
sudo apt-add-repository ppa:happyaron/ppa
sudo apt-get update

sudo apt-get install openfetion -y --force-yes

sudo apt-get install sun-java6-jdk -y

sudo apt-get install vim-gnome vim -y --force-yes
sudo apt-get install human-theme
sudo apt-get install nautilus-open-terminal -y --force-yes
sudo apt-get install leafpad -y --force-yes
sudo apt-get install rar unrar tree -y --force-yes
sudo apt-get install p7zip-full

sudo apt-get install gcolor2

# mgp file, MagicPoint, an X11 based presentation tool(like powerpoint)
sudo apt-get install mgp -y

sudo apt-get install gnome-device-manager -y

# Chromium, fast and best browser
sudo apt-get install chromium-browser -y
# flash plugin
sudo apt-get install adobe-flashplugin -y


# ime
sudo apt-get install ibus ibus-pinyin ibus-table-wubi -y

# feiqiu
sudo apt-get install g2ipmsg -y --force-yes

# usbboot
sudo apt-get install libtool -y --force-yes
sudo apt-get install libconfuse0 libconfuse-dev
sudo apt-get install libusb-dev -y --force-yes
sudo apt-get install libusb-1.0-0-dev

# make xconfig needs qt
sudo apt-get install libqt4-dev -y

#sudo apt-get install mplayer-nogui
sudo apt-get install mplayer -y
#sudo apt-get install mplayer-skin
sudo apt-get install smplayer -y

sudo apt-get install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad -y
# for asf files
sudo apt-get install gstreamer0.10-plugins-ugly -y

sudo apt-get install ctags #cscope
sudo apt-get install git-core -y --force-yes
sudo apt-get install git-email -y
sudo apt-get install subversion -y --force-yes
sudo apt-get install mercurial -y

# make menuconfig need this
sudo apt-get install libncurses5-dev

sudo apt-get install ckermit automake -y --force-yes

sudo apt-get install thunderbird -y --force-yes

sudo apt-get install system-config-samba -y

# The default installation of Ubuntu 10.04 missing the following packages
# that needed by android

sudo apt-get install g++ -y
sudo apt-get install bison flex gperf
sudo apt-get install zlib1g-dev libssl-dev -y --force-yes
sudo apt-get install libx11-dev -y --force-yes
sudo apt-get install nfs-kernel-server -y --force-yes
sudo apt-get install libglib2.0-dev -y --force-yes
sudo apt-get install ant1.8 -y

sudo apt-get install tftp tftpd openbsd-inetd
sudo mkdir /tftpboot
sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot
# need to edit /etc/inetd.conf 
# sudo /etc/init.d/openbsd-inetd restart
sudo apt-get install openssh-server -y

sudo apt-get install chmsee -y --force-yes

# to fix evince parsing Chinese issue
sudo apt-get install poppler-data

sudo apt-get install flashgot -y

wget -c http://files.zentus.com/sqlitejdbc/sqlitejdbc-v056.jar
sudo cp ~/sqlitejdbc-v056.jar /usr/share/java

# beyound compare
sudo gdebi /opt/software/ubuntu/bcompare/bcompare-3.3.3.14128_i386.deb

# for freerunner
sudo apt-get install dfu-util

sudo apt-get install stardict

# used for limit bandwidth
sudo apt-get install wondershaper -y --force-yes

# version 0.3 has issue, install from source
# sudo apt-get install openocd -y

# make pdfdocs
#sudo apt-get install docbook-utils -y --force-yes

#sudo apt-get install amule-gnome-support

#sudo apt-get install xchm
#not good
#Error loading CHM file!

#sudo apt-get install meld

#sudo apt-get install numlockx 

#how to remove a package
#sudo apt-get install hexcurse-

#sudo apt-get install amsn emesene eva

# sudo apt-get install recordmydesktop gtk-recordmydesktop 
# sudo apt-get install xvidcap istanbul -y
