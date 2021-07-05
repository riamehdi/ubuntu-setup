#!/bin/bash

echo "Welcome! Let's start setting up your system xD It could take more than 10 minutes, be patient"

sudo apt-get update

echo 'installing Openjdk-8-jdk'
sudo apt install openjdk-8-jdk

echo "export LD_LIBRARY_PATH=${HOME}/libs/" >> .bashrc
source ~/.bashrc
echo $LD_LIBRARY_PATH

echo 'installing curl'
sudo apt install curl -y

echo 'installing vim'
sudo apt install vim -y

echo 'installing stacer'
sudo apt-get install stacer -y

echo 'installing screen'
sudo apt install screen

echo 'installing ADB'
sudo apt-get install -y android-tools-adb android-tools-fastboot

echo 'installing scrcpy'
sudo apt install scrcpy

echo 'installing Scanner Ip adresse Network'
sudo apt-get install arp-scan

clear

echo 'installing git'
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Olavio Lacerda\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"olavio.lacerda@hotmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens'
gsettings set org.gnome.mutter workspaces-only-on-primary false

source ~/.bashrc

echo 'installing nvm'
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

echo '\nexport PATH=/usr/local/share/npm/bin:$PATH\n'

echo '\nexport NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"\n' >> .bashrc

source ~/.bashrc
nvm --version
nvm install 16
nvm alias default 16
node --version
npm --version

source ~/.bashrc

clear

echo 'installing EMQX'
sudo curl https://repos.emqx.io/install_emqx.sh | bash
emqx start

clear

echo 'start '
touch $HOME/java.sh
mkdir $HOME/.dooha
touch $HOME/.dooha/config_box_1.xml
touch $HOME/.dooha/config_box_2.xml
touch $HOME/.dooha/config_box_3.xml
touch $HOME/.dooha/config_box_4.xml

echo 'All tools successfully installed. You are ready to shine :).'
