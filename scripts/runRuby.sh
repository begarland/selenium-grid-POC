#! /bin/bash

cd $GITHUB_WORKSPACE/tests

bundle install 

bundle exec cucumber --publish BROWSER=chrome 
bundle exec cucumber --publish BROWSER=firefox 
bundle exec cucumber --publish BROWSER=safari 