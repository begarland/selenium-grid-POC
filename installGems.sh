#!/bin/bash -l

sudo apt-get update
sudo apt-get install ruby2.6 -y

cd $GITHUB_WORKSPACE/tests/

gem install watir webdrivers faker --user-install
