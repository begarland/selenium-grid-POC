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
docker node inspect self --format '{{ .Status.Addr  }}'
ip addr show
hostname -I

cd tests/

# npm install

echo "Starting tests..."


# node webdriver-example.js
ruby watir-example.rb

echo "Leaving swarm..."

docker stack rm grid
docker swarm leave --force