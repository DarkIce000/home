echo -e "Getting latest update.................................................. \n \n \n"

#getting full upgrade 
sudo apt update 
sudo apt dist-upgrade 

#Adding bunch of the repository for the essentials apps
echo -e "Adding additional repositories to your system for code nvim................................ \n \n \n"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:obsproject/obs-studio

#installing the softwares 
sudo apt update
sudo apt-get install -y wget kdeconnect ffmpeg obs-studio neovim vlc rofi lxappearance python3 python3-pip gpg
python3 -m pip install virtualenv

curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3 -y

#getting configrations for the i3window manager
echo -e "setting up configration files for the i3 wm \n"
mkdir -p ~/.config/i3/
ln -sf ~/dotfiles/i3status.conf ~/i3status.conf
ln -sf ~/dotfiles/config ~/.config/i3/config


#downloading google chrome and vscode 
echo -e "Installing google chrome ...................."
chrome="google-chrome-stable_current_amd64.deb"
curl -# -O https://dl.google.com/linux/direct/$chrome
sudo dpkg -i $chrome && rm -f $chrome
echo -e "\n $? \n"



#downloading code 
echo -e "Installing code..........."

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code -y

echo -e "\n $? \n"
