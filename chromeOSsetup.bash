#!/bin/bash

DIR=/home/chronos/user

curl https://raw.githubusercontent.com/dnschneid/crouton/master/installer/crouton > $DIR/crouton
sudo bash -e $DIR/crouton -u -r xenial -t audio,cli-extra,core,extension,keyboard,touch,unity,x11,xiwi

curl https://raw.githubusercontent.com/baddogdown/stuff/master/linuxToolSetup.sh > $DIR/linuxToolSetup.sh

echo ""
echo "---------------------------------------"
echo "Entering new chroot ENV.  You will probably want to run the following once in there..."
echo ""
echo "bash -e ./linuxToolSetup.sh"
echo ""
echo ""
echo ""
sudo enter-chroot


exit 0
