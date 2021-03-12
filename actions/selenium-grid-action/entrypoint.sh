#!/bin/sh -l

echo "downloading things"

apt-get update
apt install docker.io -y
docker --version

apt install nodejs -y
apt install npm -y

echo "Starting swarm..."

cd $GITHUB_WORKSPACE/

docker swarm init
docker stack deploy -c docker-compose.yml grid

cd tests/

echo "Starting tests..."

npm install
node webdriver-example.js
ruby watir-example.rb

echo "Leaving swarm..."

docker stack rm grid
docker swarm leave --force