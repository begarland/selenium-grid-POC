#! /bin/bash

curl http://localhost:4444/wd/hub

cd $GITHUB_WORKSPACE/tests

npm install

node webdriver\-example.js