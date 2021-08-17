#! /bin/bash

java -jar selenium-server-standalone.jar
java -jar -Dwebdriver.gecko.driver=.\drivers\geckodriver.exe -Dwebdriver.chrome.driver=.\drivers\chromedriver.exe selenium-server-standalone.jar -role node -nodeConfig node.json

curl http://localhost:4444/wd/hub
curl http://127.0.0.1:4444/wd/hub

echo "whyyy aren't you workingggg"