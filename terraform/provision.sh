#!/bin/sh
echo "Provisioning boostrap machine ..."

echo "Installing necessary packages ..."
apt-get update -y
apt-get upgrade -y
sudo apt-get install -y build-essential git
sudo apt-get install -qq python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python

echo "Clone the repo"
git clone https://github.com/swade1987/hands-on-with-kubernetes-workshop.git