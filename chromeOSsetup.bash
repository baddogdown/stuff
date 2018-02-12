#!/bin/bash

curl https://raw.githubusercontent.com/dnschneid/crouton/master/installer/crouton > /home/chronos/user/Downloads/crouton
sudo bash -e /home/chronos/user/Downloads/crouton -r xenial -t audio,cli-extra,core,extension,keyboard,touch,unity,x11,xiwi

curl https://raw.githubusercontent.com/baddogdown/stuff/master/linuxToolSetup.sh > /home/chronos/user/linuxToolSetup.sh
sudo bash -e /home/chronos/user/linuxToolSetup.sh

exit 0
