#!/bin/bash

# get the basics
sudo apt-get update
sudo apt-get -y install git mariadb-client curl ant make python jq npm openjdk-8-jdk

cd ~
if [ -d ~/google-cloud-sdk ];then
	echo "google-cloud-sdk appears already installed, dont dowload.  If want to re-sintall delete the dir first."
else
	curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-150.0.0-linux-x86_64.tar.gz > google-cloud-sdk.tar.gz
	tar -zxvf google-cloud-sdk.tar.gz
	~/google-cloud-sdk/install.sh
fi

. ~/.bashrc;
. ~/.bashrc;

gcloud --quiet components update
gcloud --quiet components install kubectl

# Run gcloud init to get started
gcloud init

if [ ! -d ~/repos ];then
	mkdir ~/repos
fi
cd ~/repos

echo ""
echo "--------------------------------------"
echo "Setting up github stuff init"
echo ""
read -p "Enter your github login/email: " GITHUB_EMAIL
echo ""
read -p "Enter a username (to use in github commits): " GITHUB_USER
echo ""

read -p "Do you want to (re)create ssh keys ? [y|anythnig else for no]" CREATE_SSHKEYS
if [ "$CREATE_SSHKEYS" = "y" ];then
	echo ""
	echo "Creating ssh keys.  You need to upload these as a new public key on github agaisnt the account: $GITHUB_EMAIL"
	echo ""
	ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL"
fi
echo ""
echo "Make sure you have added your github public key created above to your guithub account...[press return to continue]"; read CONTINUE

echo ""
echo "Setting up git config --global user.email"
git config --global user.email "$GITHUB_EMAIL"

echo ""
echo "Setting up git config --global user.name"
git config --global user.name "$GITHUB_USER"
echo ""
echo ""

echo ""
echo "Cloning some repos"
echo ""
for REPO in efundamentals/release-management efundamentals/internal-tools baddogdown/stuff
do

	echo ""
	echo "--------------------------------------"
	echo "Cloning $REPO"
	echo ""
	git clone git@github.com:$REPO.git

done


exit 0
