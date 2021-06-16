#! /bin/bash

cd $GITHUB_WORKSPACE/tests

sudo gem install bundler

bundle install 

# Chrome
# bundle exec cucumber --format message -o ./artifacts/chrome_windows.ndjson BROWSER=chrome PLATFORM='windows 10' BROWSER_VERSION=latest &
# bundle exec cucumber --format message -o ./artifacts/chrome_mac.ndjson BROWSER=chrome PLATFORM='macOS 11' BROWSER_VERSION=latest &

# # Firefox
# bundle exec cucumber --format message -o ./artifacts/firefox_windows.ndjson BROWSER=firefox PLATFORM='windows 10' BROWSER_VERSION=latest &
# bundle exec cucumber --format message -o ./artifacts/firefox_mac.ndjson BROWSER=firefox PLATFORM='macOS 11' BROWSER_VERSION=latest &

# # Edge
# bundle exec cucumber --format message -o ./artifacts/edge_windows.ndjson BROWSER=MicrosoftEdge PLATFORM='windows 10' BROWSER_VERSION=latest &
# bundle exec cucumber --format message -o ./artifacts/edge_mac.ndjson BROWSER=MicrosoftEdge PLATFORM='macOS 11' BROWSER_VERSION=latest &

# # IE
# bundle exec cucumber --format message -o ./artifacts/ie_windows.ndjson BROWSER=internet_explorer PLATFORM='windows 10' BROWSER_VERSION=latest &

# # Safari
bundle exec cucumber --format message -o ./artifacts/safari_mac.ndjson  BROWSER=safari PLATFORM='macOS 11' BROWSER_VERSION=latest &

wait