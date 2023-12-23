echo "Getting latest update................................................................................................... \n \n \n"

#getting full upgrade 
sudo apt update 
sudo apt-get full-upgrade 

echo -e "Adding additional repositories to your system for google-chrome code nvim.................................................\n \n \n"

#Adding bunch of the repository for the essentials apps
sudo add-apt-repository 'deb [arch=amd64] "https://dl.google.com/linux/chrome/deb/" stable main'
sudo add-apt-repository 'deb [arch=amd64,arm64,armhf] http://packages.microsoft.com/repos/code stable main'
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:obsproject/obs-studio

#installing the softwares 
sudo apt update
sudo apt-get install git dolphin google-chrome-stable code kdeconnect ffmpeg obs-studio neovim vlc rofi lxappearance python3 pip
python3 -m pip install virtualenv
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3
echo -e "Software installtion finished .......................................................................... \n \n \n"

#getting configrations for the i3window manager
echo -e "setting up configration files for the i3 wm \n"
git clone https://github.com/DarkIce000/dotfiles.git
cd dotfiles
mkdir -p ~/.config/i3/
ln -sf ~/dotfiles/i3config.conf ~/i3config.conf
ln -sf ~/dotfiles/config ~/.config/i3/config
