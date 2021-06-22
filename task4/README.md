### Task4 Ansible 

I will be used Aws Linux.
created 3 instances 
AnsibleMaster and web1 web2 
http://prntscr.com/15stkmc
install Ansible use 
```
sudo pip install ansible
```

### created hosts.txt
http://prntscr.com/15su54g

### created ansible.cfg
http://prntscr.com/15su9t2

### Ping pong test
```
ansible all -m ping 
```
http://prntscr.com/15sug3l

### Created simple playbook 
install python, install pip, and Docker 
```
---
- hosts: aws
  become: true
  tasks:
    - name: Install Python
      yum: name=python state=latest

    - name: install pip
      yum: name=python-pip state=latest

    - name: install Docker
      yum: name=docker state=latest


    - name: assicurati che docker sia attivo
      service:
         name: docker
         state: started
         enabled: yes

    - name: restart docker
      service:
         name: docker
         state: restarted
```

http://prntscr.com/15sulxg

http://prntscr.com/15su12a

### connect to web1 instances check python-pip and Docker version 
http://prntscr.com/15suwzh 


### extra task
we need next: httpd, Mysql, phpmyadmin
```
---
- hosts: ubuntu
  become: true
  vars_files:
    - pass.yml
  tasks:

    - name: Update apt cache
      apt: update_cache=yes cache_valid_time=3600

    - name: Upgrade all apt packages
      apt: upgrade=dist

    - name: Install dependencies
      apt:
        name: "{{ packages }}"
        state: present
        update_cache: yes
      vars:
        packages:
        - apt-transport-https
        - ca-certificates
        - curl
        - software-properties-common
        - gnupg-agent
      


    - name: install python package manager
      apt:
       name: python3-pip 


   
    - name: Install docker Package manager
      apt:
       name:
         - python3-docker
         - docker-compose 


    - name: Add user to docker group
      user:
        name: "{{ansible_user}}"
        group: docker


        
    - name: httpd container
      docker_container:
        name: apache
        image: httpd
        ports: ['80:80']

    - name: mysql container
      docker_container:
        name: mysql
        image: mysql
        ports: ['856:856']
        hostname: mysql
        env:
          MYSQL_ROOT_PASSWORD: "{{ mysqlroot_password }}"
          MYSQL_USER: "{{db_user}}"
          MYSQL_PASSWORD: "{{ mysqlpassword }}"
          MYSQL_DATABASE: mydata

    - name: phpmyadmin container
      docker_container:
        name: phpmyadmin
        image: phpmyadmin
        ports: ['81:80']
        env:
          PMA_HOST: "{{ phpmyadmin_db_ip }}"
          PMA_USER: "{{db_user}}"
          PMA_PASSWORD: "{{ phpmyadmin_password }}"
````
create env file with passwprd
used ansible-vault create pass.yml 
```
$ANSIBLE_VAULT;1.1;AES256
37383763666537613461303862616336326438663563303533306130363134373663663633666364
3231353632656466353161336239303932336536376131350a643332313937396637323434326236
30383366633237353638393633373966303662386332613038613530343032663231363737376535
6631383461656364350a386538303435613137656231383938626439633063343133333337623036
32333339613633353835626137636431333165366563633133623363623735363535386336333366
61376435323839356233623037663062633434356266316439323233646634666535626638613263
66626262623132373165316631303831363837333036643165616237386638373832646233346230
34383834353330653564333439333563323263616233663435366165633832363563653063383937
33363235316539623463383930643664303234323762353132363835336138333566376563316461
36643864343263613334336463336436633262613032383636633435613265363935666231663733
393264396439633931353765316434643164
```
start ansible-playbook with command --ask-vault-pass
http://prntscr.com/16bafil


 ### Created dynamc inventory 
nano aws_ec2.yml 
```
plugin: aws_ec2
regions:
  - eu-central-1
keyed_groups:
  - key: tags.Name
  - key: tags.Group
filters:
  instance-state-name : running
compose:
  ansible_host: public_ip_address
```
 change value in ansible.cfg
 ```
[defaults]
hot_keys_checking = false
interpreter_python = auto_silent

[inventory]
enable_plugins = host_list, script, auto, yaml, ini, toml
```
check servers
ansible-inventory -i aws_ec2.yml --graph

http://prntscr.com/16bjt9j

