#!/bin/sh -l

echo "downloading things"

apt-get update
apt install docker.io -y
docker --version

apt install nodejs -y
apt install npm -y

gem install watir webdrivers faker

echo "Starting swarm..."

cd $GITHUB_WORKSPACE/

docker swarm init
docker stack deploy -c docker-compose.yml grid
# docker node inspect self --format '{{ .Status.Addr  }}'
# ip addr show
# hostname -I

# curl http://10.1.0.4:4444/wd/hub
# curl http://172.17.0.2:4444/wd/hub
# curl http://hub:4444/wd/hub


vim -E -s /etc/hosts << EOF
:%s127.0.0.1	localhost
:%s255.255.255.255	broadcasthost
:%s::1             localhost
:%s127.0.0.1 kubernetes.docker.internal
:update
:quit
EOF
cd tests/

npm install

echo "Starting tests..."


node webdriver-example.js
ruby watir-example.rb

echo "Leaving swarm..."

docker stack rm grid
docker swarm leave --force