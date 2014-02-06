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
sudo apt-get install winff libavcodec-extra-54 -y
sudo apt-get install freetuxtv -y
########################################################################



############################## Bluetooth ###############################
sudo apt-get install blueman
sudo apt-get install bluez-hcidump

# used for locking/unlocking ubuntu
sudo apt-get install blueproximity -y
########################################################################



############################## misc ####################################
# nfs server
sudo apt-get install nfs-kernel-server -y

sudo apt-get install valgrind

sudo apt-get install flashplugin-installer -y

# cisco vpn
sudo apt-get install openconnect -y

#  e.g. errno 5
# EIO 5 Input/output error
sudo apt-get install errno -y

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
########################################################################
