# NOTE: this is NOT intended to be run as a script!
#
# explanation: steps I follow when installing ubuntu on either my macbook pro
#              or my (non-mac) desktop.
#

#### partition settings ####
#currently just use defaults


#### system backups #### 
#install timeshift and take snapshot of the system
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift
#take "fresh install" snapshot of the system


#### wireless ####
#if wireless isn't already working, appropriate fix will depend on your card
#fix for BCM4331 (rev 02) (on mbp 8.1):
sudo apt-get install bcmwl-kernel-source

#fix for BCM4306 (rev 03) (card in MY desktop):
sudo apt-get install firmware-b43-installer
sudo modprobe -r b43 #ssb brcmfmac brcmsmac bcma
sudo modpobe b43 

#### desktop environment ####
#install gnome classic then login using 'gnome classic (metacity)'
sudo apt-get install gnome-session-fallback

#change width of window borders 
sudo nano /usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml
	# <distance name="left_width" value="3"/>
	# <distance name="right_width" value="3"/>
	# <distance name="bottom_height" value="3"/>

#### mac keyboard specific ####
## switching ctrl & cmd key bindings ##
#move .Xmodmap to /home/nick/.Xmodmap

#prevent switched keybindings from resetting
gsettings set org.gnome.settings-daemon.plugins.keyboard active false

#switch bindings for current session
xmodmap /home/nick/.Xmodmap 

#add startup progam "cmd ctrl switcher" "/usr/bin/xmodmap /home/nick/.Xmodmap"

#change keybindings for changing windows
sudo apt-get install dconf-tools 
#nav to org/gnome/desktop/wm/keybindings
#switch-group               '<Control>Above_Tab'
#switch-applications        '<Control>Tab'
#######

#### make terminal easier to use ####
#open terminal, edit->keyboard shortcuts..
#remove shift from the shortcuts, eg. make copy 'ctrl c'
#note: above we binded 'ctrl c' to 'cmd c' on a mac keyboard


#### back up sudoers file ####
sudo cp /etc/sudoers /etc/sudoers-backup


#### install packages ####
sudo apt-get install ubuntu-restricted-extras	
sudo apt-get install chromium-browser
sudo gedit /usr/share/applications/chromium-browser.desktop
#change Exec=chromium-browser %U
#to Exec=chromium-browser --incognito %U
sudo apt-get install pepperflashplugin-nonfree

#installing gmp properly
#download latest gmp-VERSION.tar.bz2 from https://gmplib.org/#DOWNLOAD
tar -xvf gmp-VERSION.tar.bz2
cd GMP-VERSION
./configure --prefix=/usr/local/lib/gmp
make
sudo make install

sudo apt-get install build-essential 
sudo apt-get install libboost-all-dev
#sudo apt-get install libgmp3-dev libgmp10-doc libmpfr-dev
sudo apt-get install linux-headers-$(uname -r)
sudo apt-get install libwxgtk2.8-0
sudo apt-get install libwxgtk2.8-dev
sudo apt-get install codeblocks
sudo apt-get install codeblocks-dbg   
	#need plugin liboccurrenceshighlighting.so for selected-highlighting

sudo apt-get install ktorrent
sudo apt-get install pidgin
sudo apt-get install vlc
sudo apt-get install nautilus-dropbox

sudo apt-get install git
git config --global user.name "username"
git config --global user.email "email address"
mkdir /home/nick/Repositories

sudo apt-get install texlive-full       #takes a few hours
sudo apt-get install texlive-latex-extra
sudo apt-get install texstudio
sudo apt-get install jabref
sudo apt-get install latexdraw

#setup scripts/services
#setup /usr/local/bin/notify-user
#setup /usr/local/bin/hdmi-sound-toggle
#setup /etc/network/if-up.d/dropbox-toggle


#### fixing bookmarks ####
sudo nano ~/.config/gtk-3.0/bookmarks 
	file:///home/nick/Documents
	file:///home/nick/Downloads
	file:///home/nick/Dropbox
	file:///home/nick/Music
	file:///home/nick/Pictures
	file:///home/nick/Repositories
	file:///home/nick/Videos


#Take "complete install" snapshot of the system


#### more information ####
#http://ubuntuguide.org/wiki/Ubuntu_Trusty
#http://www.thegeekstuff.com/2010/11/50-linux-commands/
#http://linuxcommand.org/
lsb_release -a          #find version of ubuntu 
uname -a                #find version of kernel 

sudo apt-get update         #update apt package database
sudo apt-get upgrade        #upgrade packages
sudo apt-get dist-upgrade   #upgrade distribution


### network analysis ###
sudo apt-get install wireshark
sudo apt-get install ngrep
