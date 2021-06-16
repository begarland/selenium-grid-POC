cd $GITHUB_WORKSPACE/tests


chmod +x ./cucumber-json-formatter

# Process Messages

# Chrome
cat ./artifacts/chrome_windows.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/chrome_windows.json
cat ./artifacts/chrome_mac.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/chrome_mac.json

# Firefox
cat ./artifacts/firefox_windows.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/firefox_windows.json
cat ./artifacts/firefox_mac.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/firefox_mac.json

# Edge
cat ./artifacts/edge_windows.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/edge_windows.json
cat ./artifacts/edge_mac.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/edge_mac.json

# IE
cat ./artifacts/ie_windows.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/ie_windows.json

# Safari
cat ./artifacts/safari_mac.ndjson | ./cucumber-json-formatter --format ndjson  > ./artifacts/safari_mac.json

# Build HTML report

# Chrome
report_builder -s artifacts/chrome_windows.json -o artifacts/chrome_windows_report
report_builder -s artifacts/chrome_mac.json -o artifacts/chrome_mac_report

# Firefox
report_builder -s artifacts/firefox_windows.json -o artifacts/firefox_windows_report
report_builder -s artifacts/firefox_mac.json -o artifacts/firefox_mac_report

# Edge
report_builder -s artifacts/edge_windows.json -o artifacts/edge_windows_report
report_builder -s artifacts/edge_mac.json -o artifacts/edge_mac_report

# IE
report_builder -s artifacts/ie_windows.json -o artifacts/ie_windows_report

# Safari
report_builder -s artifacts/safari_mac.json -o artifacts/safari_mac_report
