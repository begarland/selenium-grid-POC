#! /bin/bash

java -jar selenium-server-standalone.jar
java -jar -Dwebdriver.gecko.driver=./drivers/geckodriver -Dwebdriver.chrome.driver=./drivers/chromedriver selenium-server-standalone.jar -role node -nodeConfig node.json

webdriver-manager status
webdriver-manager start --standalone
webdriver-manager status
