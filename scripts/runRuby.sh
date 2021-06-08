#! /bin/bash

cd $GITHUB_WORKSPACE/tests

sudo gem install bundler

bundle install 

chmod +x ./scripts/cucumber-json-formatter

bundle exec cucumber --retry 2 -f progress --publish --format message -o ./artifacts/chrome.ndjson BROWSER=chrome 
bundle exec cucumber --retry 2 -f progress --publish --format message -o ./artifacts/firefox.ndjson BROWSER=firefox 
# bundle exec cucumber --format message -o ./artifacts/safari.ndjson BROWSER=safari  
