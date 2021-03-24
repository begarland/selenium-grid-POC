#!/bin/sh -l

echo "downloading things"

apt-get update
apt install docker.io -y
# apt-get install docker-ce=docker-ce_20.10.5~3-0~ubuntu-focal_amd64 docker-ce-cli=_20.10.5~3-0~ubuntu-focal_amd64 containerd.io
docker --version

apt install nodejs -y
apt install npm -y
apt install vim -y
# apt install curl -y


gem install watir webdrivers faker

echo "Starting swarm..."

echo $(cat /etc/os-release)

cd $GITHUB_WORKSPACE/

# docker start

docker swarm init
docker stack deploy -c docker-compose.yml grid --name selgrid --publish 
docker node inspect self --format '{{ .Status.Addr  }}'
ip addr show
hostname -I

vim -E -s /etc/hosts << EOF
:%s127.0.0.1	localhost
:%s255.255.255.255	broadcasthost
:%s::1             localhost
:%s127.0.0.1 kubernetes.docker.internal
:update
:quit
EOF

echo $(cat /etc/hosts)

docker ps -a

cd tests/

npm install


node webdriver-example.js
ruby watir-example.rb 

echo "Starting tests..."



echo "Leaving swarm..."

docker stack rm grid
docker swarm leave --force

# cd ..


# docker-compose -f docker-compose.yml down