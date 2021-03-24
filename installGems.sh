#!/bin/bash -l

sudo apt-get update
sudo apt-get install ruby-full

export PATH="/home/runner/.gem/ruby/2.7.0/bin:$PATH"


cd $GITHUB_WORKSPACE/tests/

gem install watir webdrivers faker --user-install
