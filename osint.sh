#!/bin/bash

sudo mkdir /scripts

if [[ ! -e /scripts/upgrade ]]
then
	cat << EOF | sudo tee /scripts/upgrade > /dev/null
#!/bin/bash
sudo dpkg --configure -a
sudo apt update
sudo apt -y upgrade
#list=$(apt -y list --upgradable | awk -e 'BEGIN{FS="/"}{print $1}'|head -100)
#sudo apt -y install only-upgrade $list
sudo apt -y full-upgrade
sudo apt -y autoremove
sudo apt -y clean
sudo apt -y purge
EOF
	sudo chmod +x /scripts/upgrade	
	echo "/scripts/upgrade done!"
fi

echo "PATH=\$PATH:/scripts" | sudo tee $HOME/.profile
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

/scripts/upgrade
sudo apt install openssh-server curl
sudo ufw allow ssh

#-------------------------------------------------------------------------------
#INSTALL OSINT TOOLS-BASIC
#-------------------------------------------------------------------------------
sudo snap install vlc
sudo apt update
sudo apt upgrade -y
sudo apt install -y ffmpeg
sudo apt install -y python3-pip
sudo -H pip install youtube-dl
sudo -H pip install yt-dlp
sudo -H pip install youtube-tool
cd ~/Desktop
sudo apt install -y curl
curl -u osint9:book143wt -O https://inteltechniques.com/data/osintbook9/vm-files
.zip
unzip vm-files.zip -d ~/Desktop/
mkdir ~/Documents/scripts
mkdir ~/Documents/icons
cd ~/Desktop/vm-files/scripts
cp * ~/Documents/scripts
cd ~/Desktop/vm-files/icons
cp * ~/Documents/icons
cd ~/Desktop/vm-files/shortcuts
sudo cp * /usr/share/applications/
cd ~/Desktop
rm vm-files.zip
sudo -H pip install streamlink
sudo -H pip install Instalooter
sudo -H pip install Instaloader
sudo -H pip install toutatis
mkdir ~/Downloads/Programs
cd ~/Downloads/Programs
sudo apt install -y git
git clone https://github.com/Datalux/Osintgram.git
cd Osintgram
sudo apt-get install libncurses5-dev libffi-dev -y
sudo -H pip install -r requirements.txt -I
echo "This asks for IG username/pass, skip if desired"
make setup #(This asks for IG username/pass, skip if desired)
sudo snap install gallery-dl
sudo snap connect gallery-dl:removable-media
cd ~/Downloads
sudo apt install default-jre -y
wget https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar
cd ~/Downloads/Programs
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
udo -H pip install -r requirements.txt -I
sudo -H pip install socialscan -I
sudo -H pip install holehe -I
cd ~/Downloads/Programs
git clone https://github.com/WebBreacher/WhatsMyName.git
cd WhatsMyName/whatsmyname
sudo -H pip install -r requirements.txt -I
cd ~/Documents/scripts
sed -i 's/web\_accounts\_list\_checker/whats\_my\_name/g' usertool.sh
cd ~/Downloads/Programs
git clone https://github.com/martinvigo/email2phonenumber.git
cd email2phonenumber
sudo -H pip install -r requirements.txt -I
cd ~/Downloads/Programs
git clone https://github.com/ChrisTruncer/EyeWitness.git
cd EyeWitness/Python/setup
sudo -H ./setup.sh
sudo snap install amass
cd ~/Downloads/Programs
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo -H pip install -r requirements.txt -I
cd ~/Downloads/Programs
git clone https://github.com/s0md3v/Photon.git
cd Photon
sudo -H pip install -r requirements.txt -I
cd ~/Downloads/Programs
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
sudo -H pip install -r requirements.txt -I
sudo -H pip install testresources -I
sudo -H pip install pipenv -I
sudo -H pip install webscreenshot -I
cd ~/Downloads/Programs
git clone https://github.com/Lazza/Carbon14
cd Carbon14
sudo -H pip install -r requirements.txt -I
sudo apt install tor torbrowser-launcher -y
cd ~/Downloads/Programs
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb
sudo apt install -y mediainfo-gui
sudo apt install -y libimage-exiftool-perl
sudo apt install -y mat2
sudo -H pip install xeuledoc -I
cd ~/Downloads/Programs
sudo apt install subversion -y
git clone https://github.com/GuidoBartoli/sherloq.git
cd sherloq/gui
sudo -H pip install -r requirements.txt -I
sudo -H pip install matplotlib
sudo apt install -y webhttrack
sudo apt install -y libcanberra-gtk-module
cd ~/Downloads/Programs
git clone https://github.com/opsdisk/metagoofil.git
cd metagoofil
sudo -H pip install -r requirements.txt -I
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo -H pip install bdfr -I
sudo -H pip install redditsfinder -I
cd ~/Downloads/Programs
git clone https://github.com/MalloyDelacroix/DownloaderForReddit.git
cd DownloaderForReddit
sudo -H pip install -r requirements.txt -I
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_am
d64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
sudo apt install -y kazam
sudo snap install keepassxc
sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt --fix-broken install
cd ~/Documents/scripts
sed -i 's/\-\-format\=freeze //g' updates.sh
sed -i 's/install \-U/install \-U 2\> \/dev\/null/g' updates.sh
sudo -H pip list --outdated | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo -H
 pip install -U 2> /dev/null
reboot

#-------------------------------------------------------------------------------
#INSTALL FIREFOX PROFILE
#-------------------------------------------------------------------------------

cd ~/Desktop
curl -u osint9:book143wt -O https://inteltechniques.com/data/osintbook9/ff-template.zip
unzip ff-template.zip -d ~/snap/firefox/
cd ~/snap/firefox/ff-template/
cp -R * ~/snap/firefox/common/.mozilla/firefox/*.default
cd ~/Desktop
rm ff-template.zip
#Open Firefox and update all add-ons




#-------------------------------------------------------------------------------
#INSTALL SEARCH TOOLS
#-------------------------------------------------------------------------------
cd ~/Desktop
curl -u osint9:book143wt -O https://inteltechniques.com/data/osintbook9/tools.zip
unzip tools.zip -d ~/Desktop/
rm tools.zip
#INSTALL OSINT TOOLS-ADVANCED
#-------------------------------------------------------------------------------
cd ~/Downloads/Programs
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
sudo -H pip install -r REQUIREMENTS -I
cd ~/Downloads/Programs
git clone https://github.com/smicallef/spiderfoot.git
cd spiderfoot
sudo -H pip install -r requirements.txt -I
cd ~/Downloads/Programs
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo -H pip install nested-lookup -I
sudo -H pip install internetarchive -I
sudo apt install -y ripgrep
sudo -H pip install waybackpy -I
sudo -H pip install search-that-hash -I
sudo -H pip install h8mail -I
cd ~/Downloads
h8mail -g
sed -i 's/\;leak\-lookup\_pub/leak\-lookup\_pub/g' h8mail_config.ini
cd ~/Downloads/Programs
git clone https://github.com/mxrch/ghunt
cd ghunt
sudo -H pip install -r requirements.txt -I

#-------------------------------------------------------------------------------
#USER INTERFACE CONFIGURATION
#-------------------------------------------------------------------------------
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'
gsettings set org.gnome.shell favorite-apps []
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'google
-chrome.desktop', 'torbrowser.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome
.Terminal.desktop', 'updates.desktop', 'tools.desktop', 'youtube_dl.desktop', 'f
fmpeg.desktop', 'streamlink.desktop', 'instagram.desktop', 'gallery.desktop', 'u
sertool.desktop', 'eyewitness.desktop', 'domains.desktop', 'metadata.desktop', '
httrack.desktop', 'metagoofil.desktop', 'elasticsearch.desktop', 'reddit.desktop
', 'internetarchive.desktop', 'spiderfoot.desktop', 'recon-ng.desktop', 'mediain
fo-gui.desktop', 'google-earth-pro.desktop', 'kazam.desktop', 'keepassxc_keepass
xc.desktop', 'gnome-control-center.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

#-------------------------------------------------------------------------------
#SOFTWARE UPDATES
#-------------------------------------------------------------------------------
sudo apt update
sudo apt -y upgrade
sudo snap refresh
sudo apt update --fix-missing
sudo apt --fix-broken install
sudo -H pip list --outdated | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo -H
 pip install -U 2> /dev/null
cd ~/Downloads/Programs/sherlock
git pull https://github.com/sherlock-project/sherlock.git
cd ~/Downloads/Programs/WhatsMyName
git pull https://github.com/WebBreacher/WhatsMyName.git
cd ~/Downloads
wget -N https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
cd ~/Downloads/Programs/EyeWitness
git pull https://github.com/ChrisTruncer/EyeWitness.git
cd ~/Downloads/Programs/Sublist3r
git pull https://github.com/aboul3la/Sublist3r.git
cd ~/Downloads/Programs/Photon
git pull https://github.com/s0md3v/Photon.git
cd ~/Downloads/Programs/theHarvester
git pull https://github.com/laramies/theHarvester.git
cd ~/Downloads/Programs/Carbon14

git pull https://github.com/Lazza/Carbon14
cd ~/Downloads/Programs/metagoofil
git pull https://github.com/opsdisk/metagoofil.git
cd ~/Downloads/Programs/sherloq
git pull https://github.com/GuidoBartoli/sherloq.git
cd ~/Downloads/Programs/recon-ng
git pull https://github.com/lanmaster53/recon-ng.git
cd ~/Downloads/Programs/spiderfoot
git pull https://github.com/smicallef/spiderfoot.git
cd ~/Downloads/Programs/Elasticsearch-Crawler
git pull https://github.com/AmIJesse/Elasticsearch-Crawler.git
cd ~/Downloads/Programs/ghunt
git pull https://github.com/mxrch/ghunt.git
sudo apt autoremove -y




