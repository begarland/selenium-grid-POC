#! /bin/bash

java -jar selenium-server-standalone.jar -hubConfig hub.json
java -jar -Dwebdriver.gecko.driver=./drivers/geckodriver -Dwebdriver.chrome.driver=./drivers/chromedriver selenium-server-standalone.jar -role node -nodeConfig node.json
