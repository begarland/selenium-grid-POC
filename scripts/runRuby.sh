#! /bin/bash

cd $GITHUB_WORKSPACE/tests

gem install watir
gem install webdrivers
gem install faker


bundle install 

bundle exec cucumber --publish BROWSER=chrome 
bundle exec cucumber --publish BROWSER=firefox 
bundle exec cucumber --publish BROWSER=safari 