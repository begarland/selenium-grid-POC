#! /bin/bash

cd $GITHUB_WORKSPACE/tests

sudo gem install bundler

bundle install 

bundle exec cucumber BROWSER=chrome PLATFORM='windows 10' BROWSER_VERSION=latest &
bundle exec cucumber BROWSER=chrome PLATFORM='macOS 11' BROWSER_VERSION=latest &

bundle exec cucumber BROWSER=firefox PLATFORM='windows 10' BROWSER_VERSION=latest &
bundle exec cucumber BROWSER=firefox PLATFORM='macOS 11' BROWSER_VERSION=latest &

bundle exec cucumber BROWSER=MicrosoftEdge PLATFORM='windows 10' BROWSER_VERSION=latest &
bundle exec cucumber BROWSER=MicrosoftEdge PLATFORM='macOS 11' BROWSER_VERSION=latest &

bundle exec cucumber BROWSER=internet_explorer PLATFORM='windows 10' BROWSER_VERSION=latest &
bundle exec cucumber BROWSER=safari PLATFORM='macOS 11' BROWSER_VERSION=latest &

wait