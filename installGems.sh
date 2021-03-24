#!/bin/sh -l

apt-get update
apt-get install ruby2.6 -y

cd $GITHUB_WORKSPACE/tests/

gem install watir webdrivers faker --user-install
