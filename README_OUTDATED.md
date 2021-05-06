### Pre-reqs:

Docker Desktop: https://docs.docker.com/docker-for-mac/install/

Install Docker Compose: https://docs.docker.com/compose/install/. If you have docker desktop installed on OSX, you can skip this step.

### Steps:

---

Get the latest version of the selenium hub image:

`docker pull selenium/hub`

Get the latest version of the selenium node chrome and selenium node firefox images:

`docker pull selenium/node-chrome:4.0.0-beta-1-20210215`

`docker pull selenium/node-firefox:4.0.0-beta-1-20210215`

`docker pull selenium/node-edge:4.0.0-beta-1-20210215`

`docker pull selenium/node-opera:4.0.0-beta-1-20210215`

Note: Selenium node chrome and Selenium node firefox must be used with a selenium hub.

Verify the image installations:

`docker images`

---

Create a docker compose file:

```yml
# from github.com/SeleniumHQ/docker-selenium

version: "3.7"

services:
  chrome:
    image: selenium/node-chrome:4.0.0-beta-1-20210215
    volumes:
      - /dev/shm:/dev/shm
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
    deploy:
      replicas: 1
    entrypoint: bash -c 'SE_OPTS="--host $$HOSTNAME" /opt/bin/entry_point.sh'

  edge:
    image: selenium/node-edge:4.0.0-beta-1-20210215
    volumes:
      - /dev/shm:/dev/shm
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
    deploy:
      replicas: 1
    entrypoint: bash -c 'SE_OPTS="--host $$HOSTNAME" /opt/bin/entry_point.sh'

  firefox:
    image: selenium/node-firefox:4.0.0-beta-1-20210215
    volumes:
      - /dev/shm:/dev/shm
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
    deploy:
      replicas: 1
    entrypoint: bash -c 'SE_OPTS="--host $$HOSTNAME" /opt/bin/entry_point.sh'

  opera:
    image: selenium/node-opera:4.0.0-beta-1-20210215
    volumes:
      - /dev/shm:/dev/shm
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
    deploy:
      replicas: 1
    entrypoint: bash -c 'SE_OPTS="--host $$HOSTNAME" /opt/bin/entry_point.sh'

  selenium-hub:
    image: selenium/hub:4.0.0-beta-1-20210215
    ports:
      - "4442:4442"
      - "4443:4443"
      - "4444:4444"
```

---

Spin up docker compose in detached mode:

`docker-compose -f docker-compose.yml up -d`

---

Check the status of the container with

`docker ps`

---

Point test url to the url of the docker container:`http://{ip}:4444/wd/hub`

---

From the docker-selenium docs:

- To start Docker in Swarm mode, you need to run `docker swarm init`
- To deploy the Grid, `docker stack deploy -c docker-compose.yml grid`
- Stop with `docker stack rm grid`
- Stop swarm mode `docker swarm leave --force`
