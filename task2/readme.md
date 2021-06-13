Task 2 

# access to both instances from localhost.
http://i.prntscr.com/7CAMvjT9R_enYv2YREDgSA.png
# Conncet from instance to instance via SSH
http://i.prntscr.com/3HUJkjNGSoa5mvbiNQfbZg.png
link to check apache server http://ec2-18-159-195-101.eu-central-1.compute.amazonaws.com/

## Extra task

1 create two vpc a nad b 
http://prntscr.com/159cdtv
add subnets and Internet gateways 
http://prntscr.com/159chec
http://prntscr.com/159cgax

add peering connections and two instances can connect to ich other 

1. connect with public IP 
http://prntscr.com/159n0xu
2. connect with private id 
http://prntscr.com/159n451

and the same for the second instance 
1. with public IP
http://prntscr.com/159nag6
2. with private id 
http://prntscr.com/159nf68

2-3 do in one bash scripts for 3 i used Bootsrapping and amazon Linux system

//
#!/bin/bash
echo "Start"
sudo yum -y update
sudo yum -y install httpd
sudo chmod 2775 /var/www
echo "<html><body bgcolor=blue><center><h2><p><font color=dark>Hello World</h2></center></body></html>" > /var/www/html/index.html
uname -a >> /var/www/html/index.html
sudo service httpd start
sudo systemctl enable httpd
curl localhost/index.html > /var/www/html/log.html
echo "FINISH"
//
