#! /bin/bash

cd $GITHUB_WORKSPACE/tests

sudo gem install bundler

bundle install 

bundle exec cucumber