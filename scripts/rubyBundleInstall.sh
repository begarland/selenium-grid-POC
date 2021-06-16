#! /bin/bash

cd $GITHUB_WORKSPACE/tests

gem install bundler

bundle install 

bundle exec cucumber