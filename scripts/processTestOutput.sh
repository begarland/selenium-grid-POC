#! /bin/bash

echo "process test output"

cd $GITHUB_WORKSPACE/tests

cat ./artifacts/chrome.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/chrome.json
cat ./artifacts/firefox.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/firefox.json
cat ./artifacts/safari.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/safari.json

report_builder -s artifacts/chrome.json -o artifacts/chrome_report
report_builder -s artifacts/firefox.json -o artifacts/firefox_report
report_builder -s artifacts/safari.json -o artifacts/safari_report
