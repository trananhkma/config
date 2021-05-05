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

# Config
mkdir -p ~/Hacking/me && cd ~/Hacking/me
git clone https://github.com/trananhkma/config.git
cd config
cp bashrc ~/.bashrc
cp vimrc-minium ~/.vimrc
cp gitconfig ~/.gitconfig
source ~/.bashrc

# click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

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
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
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
