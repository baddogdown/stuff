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

. ~/.bashrc

gcloud --quiet components update
gcloud --quiet components install kubectl


# Run gcloud init to get started
gcloud init

mkdir ~/repos
cd ~/repos

echo ""
echo "Enter your github login/email"; read GITHUB_USER

ssh-keygen -t rsa -b 4096 -C "$GITHUB_USER"

echo ""
echo "Make sure you have added your github public key created above to your guithub account...[press return to continue]"; read CONTINUE

for REPO in efundamentals/release-management efundamentals/internal-tools
do

	git clone git@github.com:$REPO.git

done


git clone
exit 0
