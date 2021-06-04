#! /bin/bash

cd $GITHUB_WORKSPACE/tests

bundle install 

chmod +x ./cucumber-json-formatter

bundle exec cucumber --format message -o ./artifacts/chrome.ndjson BROWSER=chrome 
bundle exec cucumber --format message -o ./artifacts/firefox.ndjson BROWSER=firefox 
bundle exec cucumber --format message -o ./artifacts/safari.ndjson BROWSER=safari 

cat ./artifacts/chrome.ndjson | ./cucumber-json-formatter --foramt ndjson  > ./artifacts/chrome.json
cat ./artifacts/firefox.ndjson | ./cucumber-json-formatter --foramt ndjson  > ./artifacts/firefox.json
cat ./artifacts/safari.ndjson | ./cucumber-json-formatter --foramt ndjson  > ./artifacts/safari.json


report_builder -s artifacts/chrome.json -o artifacts/chrome_report
report_builder -s artifacts/firefox.json -o artifacts/firefox_report
report_builder -s artifacts/safari.json -o artifacts/safari_report


