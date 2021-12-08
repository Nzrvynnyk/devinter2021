# What are the uid ranges? What is UID? How to define it?
The system User IDs from 0 to 99 allocated by the system, and shall not be created by applications.
User IDs from 100 to 499 should be reserved for dynamic allocation by system administrators and post install scripts using useradd.
UID - User id you can find this in /etc/passwd.

# GiD -- Group ID,  its need for user, and for command ls.
# How to determine belonging of user to the specific group
  groups [username]
  How to add new user 
  sudo useradd username
  sudo passwd username
  http://prntscr.com/11e6tfl
  http://prntscr.com/11e6viq
# How to change username 
 sudo usermod -l Devopsnew devops
# What is skell_dir? What is its structure?
 Directory /etc/skel/ (skel is derived from the “skeleton”) is used to initiate home directory when a user is first created
 Default permission of /etc/skel is drwxr-xr-x.
  ![image](https://user-images.githubusercontent.com/80759146/114746988-0404b680-9d59-11eb-9d95-8deda03e7a91.png)
  
 # How to remove a user from the system (including his mailbox
  userdel -r userName
  -r   ![image](https://user-images.githubusercontent.com/80759146/114747538-9c02a000-9d59-11eb-9832-7c71dbcd3a0c.png)
# How to remove a user's password and provide him with a password-free login for subsequent password change
passwd -l devops and passwd -u devops
![image](https://user-images.githubusercontent.com/80759146/114747894-fc91dd00-9d59-11eb-89db-a744ac7425c1.png)

# How to remove a user's password and provide him with a password-free login for subsequent password change
![image](https://user-images.githubusercontent.com/80759146/114748374-89d53180-9d5a-11eb-94e2-a4099ed12208.png)


