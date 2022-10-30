#!/bin/bash

sudo mkdir /scripts

if [[ ! -e /scripts/upgrade ]]
then
	cat << EOF | sudo tee /scripts/upgrade > /dev/null
#!/bin/bash
sudo dpkg --configure -a
sudo apt -y update
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
sudo apt -y install openssh-server curl vim
sudo ufw allow ssh

#curl -u osint9:book143wt -O https://inteltechniques.com/data/osintbook9/vm-files.zip


#-------------------------------------------------------------------------------
#INSTALL OSINT TOOLS-BASIC
#-------------------------------------------------------------------------------
sudo snap install vlc
sudo apt install -y ffmpeg
sudo apt install -y python3-pip
sudo pip install youtube-dl
sudo pip install yt-dlp
sudo pip install youtube-tool
cd ~/Desktop
sudo apt install -y curl
curl -O https://inteltechniques.com/data/osintbook9/vm-files.zip
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
rm -rf vm-files
sudo pip install streamlink
sudo pip install Instalooter
sudo pip install Instaloader
sudo pip install toutatis
mkdir ~/Downloads/Programs
cd ~/Downloads/Programs
sudo apt install -y git
sudo apt install -y python3.10-venv
git clone https://github.com/Datalux/Osintgram.git
cd Osintgram
python3 -m venv OsintgramEnvironment
source OsintgramEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
sudo apt install libncurses5-dev libffi-dev -y
make setup 
#(This asks for IG username/pass, skip if desired)
sudo snap install gallery-dl
sudo snap connect gallery-dl:removable-media
cd ~/Downloads
sudo apt install default-jre -y
wget https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar
cd ~/Downloads/Programs
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock		
python3 -m venv SherlockEnvironment
source SherlockEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
sudo pip install socialscan
sudo pip install holehe
cd ~/Downloads/Programs
git clone https://github.com/WebBreacher/WhatsMyName.git
cd WhatsMyName/whatsmyname
python3 -m venv WhatsMyNameEnvironment
source WhatsMyNameEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs
git clone https://github.com/martinvigo/email2phonenumber.git
cd email2phonenumber
python3 -m venv email2phonenumberEnvironment
source email2phonenumberEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs
git clone https://github.com/ChrisTruncer/EyeWitness.git
cd EyeWitness/Python/setup
sudo ./setup.sh
sudo snap install amass
cd ~/Downloads/Programs
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
python3 -m venv Sublist3rEnvironment
source Sublist3rEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs
git clone https://github.com/s0md3v/Photon.git
cd Photon
python3 -m venv PhotonEnvironment
source PhotonEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
python3 -m venv theHarvesterEnvironment
source theHarvesterEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
sudo pip install testresources
sudo pip install webscreenshot
cd ~/Downloads/Programs
git clone https://github.com/Lazza/Carbon14
cd Carbon14
python3 -m venv Carbon14Environment
source Carbon14Environment/bin/activate
sudo pip install -r requirements.txt
deactivate
sudo apt install tor torbrowser-launcher -y
cd ~/Downloads/Programs
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb
sudo apt install -y mediainfo-gui
sudo apt install -y libimage-exiftool-perl
sudo apt install -y mat2
sudo pip install xeuledoc
cd ~/Downloads/Programs
sudo apt install subversion -y
git clone https://github.com/GuidoBartoli/sherloq.git
cd sherloq/gui
python3 -m venv sherloqEnvironment
source sherloqEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
sudo pip install matplotlib
sudo apt install -y webhttrack
sudo apt install -y libcanberra-gtk-module
cd ~/Downloads/Programs
git clone https://github.com/opsdisk/metagoofil.git
cd metagoofil
python3 -m venv metagoofilEnvironment
source metagoofilEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
sudo apt install software-properties-common -y
sudo pip install bdfr
sudo pip install redditsfinder
cd ~/Downloads/Programs
git clone https://github.com/MalloyDelacroix/DownloaderForReddit.git
cd DownloaderForReddit
python3 -m venv DownloaderForRedditEnvironment
source DownloaderForRedditEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
sudo apt install -y kazam
sudo snap install keepassxc
sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt --fix-broken install
cd ~/Documents/scripts

#-------------------------------------------------------------------------------
#INSTALL FIREFOX PROFILE
#-------------------------------------------------------------------------------
#Launch and then close Firefox
#Click the Applications Menu, launch Terminal, and execute the following commands
cd ~/Desktop
curl -O https://inteltechniques.com/data/osintbook9/ff-template.zip
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
curl -O https://inteltechniques.com/data/osintbook9/tools.zip
unzip tools.zip -d ~/Desktop/
rm tools.zip

#-------------------------------------------------------------------------------
#INSTALL OSINT TOOLS-ADVANCED
#-------------------------------------------------------------------------------
cd ~/Downloads/Programs
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
python3 -m venv recon-ngEnvironment
source recon-ngEnvironment/bin/activate
sudo pip install -r REQUIREMENTS
deactivate
cd ~/Downloads/Programs
git clone https://github.com/smicallef/spiderfoot.git
cd spiderfoot
python3 -m venv spiderfootEnvironment
source spiderfootEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo pip install nested-lookup
sudo pip install internetarchive
sudo apt install -y ripgrep
sudo pip install waybackpy
sudo pip install search-that-hash
sudo pip install h8mail
cd ~/Downloads
h8mail -g
sed -i 's/\;leak\-lookup\_pub/leak\-lookup\_pub/g' h8mail_config.ini
cd ~/Downloads/Programs
git clone https://github.com/mxrch/ghunt
cd ghunt
python3 -m venv ghuntEnvironment
source ghuntEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate

#-------------------------------------------------------------------------------
#USER INTERFACE CONFIGURATION
#-------------------------------------------------------------------------------
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'
gsettings set org.gnome.shell favorite-apps []
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'google-chrome.desktop', 'torbrowser.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'updates.desktop', 'tools.desktop', 'youtube_dl.desktop', 'ffmpeg.desktop', 'streamlink.desktop', 'instagram.desktop', 'gallery.desktop', 'usertool.desktop', 'eyewitness.desktop', 'domains.desktop', 'metadata.desktop', 'httrack.desktop', 'metagoofil.desktop', 'elasticsearch.desktop', 'reddit.desktop', 'internetarchive.desktop', 'spiderfoot.desktop', 'recon-ng.desktop', 'mediainfo-gui.desktop', 'google-earth-pro.desktop', 'kazam.desktop', 'keepassxc_keepassxc.desktop', 'gnome-control-center.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

#-------------------------------------------------------------------------------
#SOFTWARE UPDATES
#-------------------------------------------------------------------------------
sudo apt update
sudo apt -y upgrade
sudo snap refresh
sudo apt update --fix-missing
sudo apt --fix-broken install
sudo pip install -U youtube-dl
sudo pip install -U yt-dlp
sudo pip install -U Instalooter
sudo pip install -U Instaloader
sudo pip install -U toutatis
sudo pip install -U gallery-dl
sudo pip install -U socialscan
sudo pip install -U holehe
sudo pip install -U testresources
sudo pip install -U webscreenshot
sudo pip install -U xeuledoc
sudo pip install -U bdfr
sudo pip install -U redditsfinder
sudo pip install -U waybackpy
sudo pip install -U internetarchive
sudo pip install -U nested-lookup
sudo pip install -U search-that-hash
sudo pip install -U h8mail
cd ~/Downloads/Programs/Osintgram
git pull https://github.com/Datalux/Osintgram.git
source OsintgramEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads
wget -N https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
cd ~/Downloads/Programs/sherlock
git pull https://github.com/sherlock-project/sherlock.git
source SherlockEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/WhatsMyName
git pull https://github.com/WebBreacher/WhatsMyName.git
cd whatsmyname
source WhatsMyNameEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/email2phonenumber
git pull https://github.com/martinvigo/email2phonenumber.git
source email2phonenumberEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/ghunt
git pull https://github.com/mxrch/ghunt
source ghuntEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/EyeWitness
git pull https://github.com/ChrisTruncer/EyeWitness.git
cd Python/setup
sudo ./setup.sh
cd ~/Downloads/Programs/Sublist3r
git pull https://github.com/aboul3la/Sublist3r.git
source Sublist3rEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/Photon
git pull https://github.com/s0md3v/Photon.git
source PhotonEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/theHarvester
git pull https://github.com/laramies/theHarvester.git
source theHarvesterEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/Carbon14
git pull https://github.com/Lazza/Carbon14
source Carbon14Environment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/sherloq
git pull https://github.com/GuidoBartoli/sherloq.git
cd gui
source sherloqEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/metagoofil
git pull https://github.com/opsdisk/metagoofil.git
source metagoofilEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/DownloaderForReddit
git pull https://github.com/MalloyDelacroix/DownloaderForReddit.git
source DownloaderForRedditEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
cd ~/Downloads/Programs/spiderfoot
git pull https://github.com/smicallef/spiderfoot.git
source spiderfootEnvironment/bin/activate
sudo pip install -r requirements.txt
deactivate
cd ~/Downloads/Programs/recon-ng
git pull https://github.com/lanmaster53/recon-ng.git
source recon-ngEnvironment/bin/activate
sudo pip install -r REQUIREMENTS
deactivate
cd ~/Downloads/Programs/Elasticsearch-Crawler
git pull https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo apt autoremove -y

#-------------------------------------------------------------------------------
#OPTIONAL CALLER ID SCRIPT
#-------------------------------------------------------------------------------
#cd ~/Documents/scripts
#curl -u osint9:book143wt -O  https://inteltechniques.com/osintbook9/cid.sh
#chmod +x cid.sh
#curl -u osint9:book143wt -O  https://inteltechniques.com/osintbook9/cid.desktop
#chmod +x cid.desktop
#sudo cp cid.desktop /usr/share/applications/
#rm cid.desktop



