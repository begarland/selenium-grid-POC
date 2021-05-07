v#! /bin/bash

osascript -e 'tell app "Terminal"
    do script "cd Documents/Github/selenium-grid-POC/scripts && java -jar selenium-server-standalone.jar -role hub -hubConfig hub.json"
end tell'

osascript -e 'tell app "Terminal"
    do script "cd Documents/Github/selenium-grid-POC/scripts && java -jar -Dwebdriver.gecko.driver=./drivers/geckodriver -Dwebdriver.chrome.driver=./drivers/chromedriver selenium-server-standalone.jar -role node -nodeConfig node.json" 
end tell'