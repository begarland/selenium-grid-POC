#! /bin/bash

java -jar selenium-server-standalone.jar
java -jar -Dwebdriver.gecko.driver=.\drivers\geckodriver.exe -Dwebdriver.chrome.driver=.\drivers\chromedriver.exe selenium-server-standalone.jar -role node -nodeConfig node.json
