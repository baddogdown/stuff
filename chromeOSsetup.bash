#!/bin/bash

curl https://goo.gl/fd3zc > ~/Downloads/crouton

sudo bash -e ~/Downloads/crouton -r xenial -t audio,cli-extra,core,extension,keyboard,touch,unity,x11,xiwi

sudo bash -e 

exit 0
