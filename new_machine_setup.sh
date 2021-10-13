#!/bin/bash

# upgrade system
sudo apt update && sudo apt upgrade -y

# common env
sudo apt install wmctrl python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject
sudo apt install git gnome-shell-extensions keepass2 python3-pip software-properties-common apt-transport-https wget vlc vim golang-go
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# zsh
sudo apt install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
sudo apt install fzf

# Config
mkdir -p ~/Hacking/me && cd ~/Hacking/me
git clone https://github.com/trananhkma/config.git
cd config
cp bashrc ~/.bashrc
cp vimrc-minium ~/.vimrc
cp gitconfig ~/.gitconfig
cp zshrc ~/.zshrc
source ~/.bashrc

# click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# workspace navigation
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right '["<Control><Alt>a"]'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left '["<Control><Alt>s"]'

# gestures
sudo gpasswd -a $USER input
cd ~/Downloads
git clone https://github.com/bulletmark/libinput-gestures.git
git clone https://gitlab.com/cunidev/gestures.git
cd libinput-gestures
sudo make install
cd ../gestures/
sudo python3 setup.py install
libinput-gestures-setup autostart
libinput-gestures-setup start
cd ~/Hacking/me/config
cp libinput-gestures.conf ~/.config/

# virtual env
cdm
git clone https://github.com/trananhkma/k8s-local.git
cd k8s-local
./host_install.sh

# terminal Case-Insensitive tab
sudo su
echo "set completion-ignore-case on" >> /etc/inputrc
exit

# cloud
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo chmod 666 /var/run/docker.sock

cdd
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

sudo apt install gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
