# /etc/apt/sources.list
# for sun-java6-jdk
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu maverick partner"

# for openfetion
sudo apt-add-repository ppa:happyaron/ppa
sudo apt-get update

sudo apt-get install openfetion -y --force-yes

sudo apt-get install sun-java6-jdk -y

sudo apt-get install human-theme
sudo apt-get install nautilus-open-terminal -y --force-yes
sudo apt-get install leafpad -y --force-yes
sudo apt-get install rar unrar tree -y --force-yes
sudo apt-get install p7zip-full

# mgp file, MagicPoint, an X11 based presentation tool(like powerpoint)
sudo apt-get install mgp -y

sudo apt-get install gnome-device-manager -y

# Chromium, fast and best browser
sudo apt-get install chromium-browser -y

# ime
sudo apt-get install ibus ibus-pinyin ibus-table-wubi -y

# feiqiu
sudo apt-get install g2ipmsg -y --force-yes

# usbboot
sudo apt-get install libtool -y --force-yes
sudo apt-get install libconfuse0
sudo apt-get install libconfuse-dev
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
sudo apt-get install bison flex
sudo apt-get install zlib1g-dev libssl-dev -y --force-yes
sudo apt-get install libx11-dev -y --force-yes
sudo apt-get install gperf
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

# firefox flash plugin
sudo apt-get install flashplugin-installer


wget -c http://files.zentus.com/sqlitejdbc/sqlitejdbc-v056.jar
sudo cp ~/sqlitejdbc-v056.jar /usr/share/java

# beyound compare
sudo dpkg -i /opt/software/ubuntu/bcompare/bcompare-3.2.4.13298_i386.deb

# for freerunner
sudo apt-get install openocd -y
sudo apt-get install dfu-util

sudo apt-get install stardict

# make pdfdocs
#sudo apt-get install docbook-utils -y --force-yes

# replace openoffice with libreoffice
#sudo apt-get purge "openoffice*.*"
#sudo add-apt-repository ppa:libreoffice/ppa
#sudo apt-get update
#sudo apt-get remove --purge openoffice*.*
#sudo apt-get install libreoffice
#sudo apt-get install libreoffice-gnome

#sudo apt-get install amule-gnome-support

#sudo apt-get install xchm
#not good
#Error loading CHM file!

#hex editor
#sudo apt-get install ghex

#sudo apt-get install meld

#svn import svn://192.168.1.87/mips/kernel/linux-2.6.32.9/branches/mmc/ -m "create mmc branch for z800"
#sudo apt-get install numlockx 
#sudo tar xjvf android-toolchain-mipsel-linux-4.2.1-new.tar.bz2 -C /

#sudo mkdir src/kernel/ src/u-boot -p

#how to remove a package
#sudo apt-get install hexcurse-

#sudo apt-get install amsn
#sudo apt-get install emesene
#sudo apt-get install eva

# feige
# sudo apt-get install iptux -y --force-yes

# sudo add-apt-repository "deb http://cz.archive.ubuntu.com/ubuntu dapper main multiverse"
# sudo apt-get install vim-gnome vim -y --force-yes
# sudo apt-get install sun-java5-jdk
# sudo apt-get install recordmydesktop gtk-recordmydesktop 
# sudo apt-get install xvidcap istanbul -y

# firefox cache directory
# /home/fdbai/.mozilla/firefox/n87lqakk.default/Cache

