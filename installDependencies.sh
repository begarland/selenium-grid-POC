#!/bin/bash -l

export PATH="/home/runner/.gem/ruby/2.7.0/bin:$PATH"


echo "installing ruby"

sudo apt-get update
sudo apt-get install ruby-full

echo "installing node and npm"
sudo apt install nodejs -y
sudo apt install npm -y


cd $GITHUB_WORKSPACE/tests/


echo "installing ruby gems"
gem install watir webdrivers faker --user-install

echo "npm install"
npm install