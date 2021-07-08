### Мониторинг: Город засыпает просыпается ....
Tasks:
* 1 Zabbix:
* 1.1 Установить на сервер - сконфигурировать веб и базу 
* 1.2 Поставить на подготовленные ранее сервера или виртуалки заббикс агенты 
* EXTRA 1.2.1: сделать это ансиблом
* 1.3 Сделать несколько своих дашбородов, куда вывести данные со своих триггеров (например мониторить размер базы данных из предыдущего задания и включать алерт при любом изменении ее размера - можно спровоцировать вручную)
* 1.4 Active check vs passive check - применить у себя оба вида - продемонстрировать.
* 1.5 Сделать безагентный чек любого ресурса (ICMP ping)
* 1.6 Спровоцировать алерт - и создать Maintenance инструкцию 
* 1.7 Нарисовать дашборд с ключевыми узлами инфраструктуры и мониторингом как и хостов так и установленного на них софта


### TASK ZABBIX

### install to the server and configure db
* 1.1
http://prntscr.com/18t4bmi 
http://prntscr.com/18tiqn6 
* 1.2
http://prntscr.com/19ahhav
* 1.3
http://prntscr.com/199uuws
send allert to Telegram Bot
http://prntscr.com/199v00o
* 1.4  
### passive check used 10050 port
```
##### Passive checks related
### Option: Server
# List of comma delimited IP addresses (or hostnames) of Zabbix servers.
# No spaces allowed. First entry is used for receiving list of and sending active checks.
# Note that hostnames must resolve hostname->IP address and IP address->hostname.
#
# Mandatory: yes
# Default:
# Server=
Server=192.168.1.206
### Option: Hostname
# Unique hostname.
# Required for active checks and must match hostname as configured on the server.
#
# Default:
# Hostname=system.uname
Hostname=testclient
### Option: ListenPort
# Agent will listen on this port for connections from the server.
#
# Mandatory: no
# Range: 1024-32767
# Default:
ListenPort=10050
```
### Active check 
Active check used 10051 port
```
ListenPort=10051
```

### 1.5 ICMP ping home server 
http://prntscr.com/19ad4au

### 1.6 
* http://prntscr.com/19ahrqr
### 1.7
* Dashboard
* http://prntscr.com/19ahq6p

