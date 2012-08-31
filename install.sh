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


# common utils
sudo apt-get install ckermit automake -y
sudo apt-get install ctags
sudo apt-get install chmsee -y
sudo apt-get install rar unrar tree -y
sudo apt-get install p7zip-full



# android stuff
sudo apt-get install g++ -y
sudo apt-get install bison flex gperf -y
sudo apt-get install zlib1g-dev libssl-dev -y
sudo apt-get install libglib2.0-dev -y

# fix build ics on precise
sudo apt-get install gcc-4.4 -y
sudo rm /usr/bin/gcc
sudo ln -s /usr/bin/gcc-4.4 /usr/bin/gcc

# libgmp.so.3 Cannot open shared object file
sudo apt-get install libgmp3c2


# lndir
sudo apt-get install xutils-dev



# other
sudo apt-get install leafpad -y
sudo apt-get install nautilus-open-terminal -y

sudo apt-get install vim-gnome -y


# internet
sudo apt-get install openfetion -y



# tftp
sudo mkdir /tftpboot
sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot
# need to edit /etc/inetd.conf 
# sudo /etc/init.d/openbsd-inetd restart
sudo apt-get install openssh-server -y


sudo apt-get install tftp tftpd openbsd-inetd -y



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
