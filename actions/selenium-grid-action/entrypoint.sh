#!/bin/sh -l

echo "downloading things"

apt-get update
apt install docker.io -y
docker --version

# apt install nodejs -y
# apt install npm -y

gem install watir webdrivers faker

echo "Starting swarm..."

cd $GITHUB_WORKSPACE/

docker swarm init
docker stack deploy -c docker-compose.yml grid

cd tests/

curl http://172.17.0.2:4444/wd/hub/status
# curl http://10.0.0.1:4444/wd/hub/status

# npm install

echo "Starting tests..."


# node webdriver-example.js
ruby watir-example.rb

echo "Leaving swarm..."

docker stack rm grid
docker swarm leave --force