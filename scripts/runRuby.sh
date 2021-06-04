#! /bin/bash

cd $GITHUB_WORKSPACE/tests

bundle install 

chmod +x ./cucumber-json-formatter

bundle exec cucumber --format message -o ./artifacts/chrome.ndjson BROWSER=chrome 
bundle exec cucumber --format message -o ./artifacts/firefox.ndjson BROWSER=firefox 
bundle exec cucumber --format message -o ./artifacts/safari.ndjson BROWSER=safari 
