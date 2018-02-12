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


gcloud --quiet components update
gcloud --quiet components install kubectl


# Run gcloud init to get started
gcloud init

exit 0
