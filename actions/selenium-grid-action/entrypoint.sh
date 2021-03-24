#!/bin/sh -l

echo "downloading things"

apt-get update
# apt install docker.io -y
apt-get install docker-ce=20.10.5~3-0~ubuntu-focal_amd64 docker-ce-cli=20.10.5~3-0~ubuntu-focal_amd64 containerd.io
docker --version

apt install nodejs -y
apt install npm -y
apt install vim -y
# apt install curl -y


gem install watir webdrivers faker

echo "Starting swarm..."

cd $GITHUB_WORKSPACE/

docker swarm init
docker stack deploy -c docker-compose.yml grid
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

docker ps -a

cd tests/

npm install

set -e

cmd="$@"

while ! curl -sSL "http://172.17.0.2:4444/wd/hub/status" 2>&1 \
        | jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
    echo 'Waiting for the Grid'
    sleep 1
done

>&2 echo "Selenium Grid is up - executing tests"
node webdriver-example.js
ruby watir-example.rb 

echo "Starting tests..."



echo "Leaving swarm..."

docker stack rm grid
docker swarm leave --force

# cd ..


# docker-compose -f docker-compose.yml down