### Task5 Ansible 

I wiil be use Aws Linux.
creted 3 instances 
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

### connect to web1 instances chack python pip and Docker version 
http://prntscr.com/15suwzh 


### Done I will continue to work on the extra