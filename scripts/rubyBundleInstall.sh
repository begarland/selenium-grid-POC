#! /bin/bash

cd $GITHUB_WORKSPACE/tests

sudo gem install bundler

bundle install 

bundle exec cucumber BROWSER=CHROME PLATFORM='windows 10' BROWSER_VERSION=91.0 &
bundle exec cucumber BROWSER=CHROME PLATFORM='macOS 11' BROWSER_VERSION=91.0 