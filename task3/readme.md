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

