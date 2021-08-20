#! /bin/bash

curl http://localhost:4444/wd/hub
curl http://127.0.0.1:4444/wd/hub

cd $GITHUB_WORKSPACE/tests

npm install

node mac\-webdriver.js