## Script to install Docker 
```
#!bin/bash
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker info
```


## install docker container with image Hello world and add n.vynnyk sandbox 2021
change index.html. 
http://prntscr.com/15h9rfy
```sudo docker exec contairname -c "echo 'Hello world \n n.vynnyk sandbox 2021" >> /var/www/html/index.html
```
## Created docker image use ubuntu 18.04


http://prntscr.com/15hggk3

## Dockerfile
```
FROM ubuntu:18.04


RUN apt-get update && \
 apt-get -y install apache2
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

ENV DEVOPS="vynnyk"
RUN echo "Nazar Vynnyk env DEVOPS = $DEVOPS" > ./index.html
RUN mv ./index.html /var/www/html/index.html

COPY task3.sh task3.sh
RUN  chmod 777  task3.sh

EXPOSE 80
CMD ./task3.sh
#CMD /root/run_apache.sh
```
## and env, and sh scrip for change env
task3.sh
```#!bin/bash
echo -e "Nazar Vynnyk DEVOPS=$DEVOPS" > index.html
mv index.html /var/www/html/index.html
apachectl -D FOREGROUND
```
sudo docker run -e DEVOPS=Nazarvynnyk -it -p 80:80 task4
http://prntscr.com/15m486m
http://prntscr.com/15m4t2d
https://i.imgur.com/xvxFk5p.gif
## task 4 push to docker hub 
```
docker login --username --password
docker tag task3:lates nvynnyk/devintership
docker commit task3 nvynnyk/devintership
docker push nvynnyk/devintership
```
## Container avalible on addres:
https://hub.docker.com/repository/docker/nvynnyk/devintership

4.1 for new account you can't autobild form git to docker hub 
use this script to build but in docker hub dosent crated repo with dockerfile. :(
http://prntscr.com/15opre5


```

name: task3

on: push
jobs:
   build-containers:
   name: Build Docker container image
   runs-on: ubuntu-latest

    steps:
    - name: Checkout code
    - uses: actions/checkout@v2
    - name: Build the Docker image
    - uses: docker/build-push-action@v1
    with: 
    username: ${{ github.actor }}
    password: ${{ secrets.GITHUB_TOKEN }}
    registry: docker.pkg.github.com
    repository: $${{ github.repositry }}/next
    tags: latest, ${{ github.run_number }}
    - name: Publish to Docker Hub
      uses: docker/build-push-action@v1
      with:
       username: ${{ secrets.DOCKER_USERNAME }}
       password: ${{ secrets.DOCKER_PASSWORD }}
       repository: nvynnyk/task3
       tags: lates, ${{ github.run_number }}

```
## task 5 
created docker-compose 
```
version: '3'

services:
 web:
     image: nvynnyk/devintership
     ports:
     - 80:80
     environment:
      - DEVOPS=${DEVOPS}
     env_file:
      - .env

 java:
    image: 0ea726542de5
    restart: always

 db:
   image: postgres:11.4-alpine
   container_name: postgres
   ports:
   - 5432:5432
   volumes:
   - ./pg_data:/var/lib/postgresql/data/pgdata
```   
   ### run all containers
   docker-compose up 
http://prntscr.com/15p6qy6

add .env file.

Done!



