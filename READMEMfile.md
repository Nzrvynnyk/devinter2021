Task 2: AWS Cloud
(Note. The assignment is written using AWS as an example. You can complete the assignment using any cloud services.)

Before completing this task, it is recommend check this video:
 https://www.youtube.com/watch?v=O1_--7IvP5g&list=PLg5SS_4L6LYsxrZ_4xE_U95AtGsIB96k9 (RU)


Important moments:
    1. Read about Cloud Services. Pro and Cons Cloud VS Bare Metal infrastructure?
    2. Read about Region, Zone in AWS. What are they for, which one will you use?
    3. Read about AWS EC2, what is it, what is it useful for?
    4. Read about AWS VPC (SG, Route, Internet Gateway).
    5. If you sign up in AWS for the first time, you will have the opportunity to use SOME AWS services for free (free tier) for 1 year. To register, you need a credit card from which it will be debited and returned 1-2$.
    6. Read about AWS Free Tier. There should be a clear of what will be free for new users and what will have to be paid for your own money.

Tasks:
    1. Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
    2. Explore AWS Billing for checking current costs. Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
    3. Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?
    4. Make sure is an ping and SSH passed from one instance to another and vice versa. Configure SSH connectivity between instances using SSH keys.
    5. Install web server (nginx/apache) to one instance; 
- Create web page with text “Hello World” and information about OS version;
- Make sure web server accessible from internet and you can see your web page “Hello World” in your browser; 
- Make sure in instance without nginx/apache you can see “Hello world” from instance with nginx/apache.

EXTRA: 
    1. Run steps 3-5 with instances created in different VPC. (connectivity must be both external and internal IP)	
    2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
    3. Run step.6 without “manual” EC2 SSH connection.

The result of this task is a link in your github to the “Hello World” web page on AWS. After checking task by the mentor, the instance may be deleted. EXTRA tasks are passed to mentors individually. 



Task 3: Docker

Docs:
    1. Read documentation about docker (https://docs.docker.com/)

Tasks:
    1. Install docker. (Hint: please use VMs or Clouds  for this.)
EXTRA 1.1. Write bash script for installing Docker. 

    2. Find, download and run any docker container "hello world". (Learn commands and parameters to create/run docker containers.
EXTRA 2.1. Use image with html page, edit html page and paste text: <Username> Sandbox 2021

3.1. Create your Dockerfile for building a docker image. Your docker image should run any web application (nginx, apache, httpd). Web application should be located inside the docker image. 
EXTRA 3.1.1. For creating docker image use clear basic images (ubuntu, centos, alpine, etc.)
3.2. Add an environment variable "DEVOPS=<username> to your docker image 
EXTRA 3.2.1. Print environment variable with the value on a web page (if environment variable changed after container restart - the web page must be updated with a new value)

4. Push your docker image to docker hub (https://hub.docker.com/). Create any description for your Docker image. 
EXTRA 4.1. Integrate your docker image and your github repository. Create an automatic deployment for each push. (The Deployment can be in the “Pending” status for 10-20 minutes. This is normal).


5.  Create docker-compose file. Deploy a few docker containers via one docker-compose file. 
    • first image - your docker image from the previous step. 5 nodes of the first image should be run;
    • second image - any java application;
    • last image - any database image (mysql, postgresql, mongo or etc.).
Second container should be run right after a successful run of a database container.
	EXTRA 5.1. Use env files to configure each service.


The task results is the docker/docker-compose files in your GitHub repository



Task 4: Ansible for beginners
Important points:

1. Read documentation about System configuration management.
2. Learn about the advantages and disadvantages of Ansible over other tools.
3. Become familiar with ansible basics and YAML syntax.
4. Basics of working with Ansible from the official documentation
EXTRA Read the Jinja2 templating documentation

Tasks:
    1. Deploy three virtual machines in the Cloud. Install Ansible on one of them (control_plane).
    2. Ping pong - execute the built-in ansible ping command. Ping the other two machines.
    3. My First Playbook: write a playbook for installing Docker on two machines and run it.
       
EXTRA 1. Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.
EXTRA 2. Playbooks should not have default creds to databases and/or admin panel.
EXTRA 3. For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).

The result of this task will be ansible files in your GitHub.


Task 4: Ansible for beginners
Важные моменты:

1. Посмотреть что такое Configuration Management Systems.
2. Преимущества и недостатки Ansible над другими инструментами 
3. Ознакомиться с основами ансибла и синтаксисом YAML
4. Основы работы с Ansible из официальной документации
EXTRA Jinja2 templating - почитать документацию

Tasks:
    1. Развернуть три виртуальные машины в облаке. На одну из них (control_plane) установить Ansible.
    2. Ping pong - выполнить встроенную команду ансибла ping. Пинговать две другие машины.
    3. Мой Первый Плейбук - написать плейбук по установке Docker на две машины и выполнить его.
       
EXTRA 1. Написать плейбук по установке Docker и одного из (LAMP/LEMP стек, Wordpress, ELK, MEAN - GALAXY нельзя) в Docker.
EXTRA 2. Вышесказанные плейбуки не должны иметь дефолтных кредов к базам данных и/или админке.
EXTRA 3.  Для исполнения плейбуков должны использоваться dynamic inventory (GALAXY можно)

Результатом выполнения данного задания  являются ansible файлы в вашем GitHub. 




Task 5: Jenkins. Автоматизируй, Управляй и Контролируй

Важные моменты:
    1. Почитать про Jenkins. Что это такое и для чего он нужен? Способы применения. Что такое императивный и декларативный подход. 

Tasks:
1. Установить Jenkins (Jenkins должен быть установлен  в Docker контейнере).
2. Установить необходимые плагины (если потребуются на ваше усмотрение).
3. Настроить несколько билд агентов. Агенты должны быть запущены в docker.
4. Создать Freestyle project. Который будет в результате выполнения на экран выводить текущее время.
5. Создать Pipeline который будет на  Jenkins Агенте, запущеном на хосте Jenkins Мастера, выполнять команду docker ps -a.
6. Создать Pipeline который будет выкачивать из вашего репозитория код и будет собирать докер образ из вашего Dockerfile (который вы писали во время знакомства с докером).
7. Передать переменную PASSWORD=QWERTY! В зашифрованном виде в докер контейнер.


EXTRA:
1. Написать pipeline который будет на дополнительной виртуальной машине запускать докер контейнер из вашего докерфайла.
2. Написать ансибл скрипт который будет разворачивать дженкинс.
3. Развернуть локальный docker registry загрузить в него докер образ, выгрузить докер образ из docker registry и запустить контейнер на окружении 
4. Настроить двухстороннюю интеграцию между Jenkins и вашим Git репозиторием. Jenkins проект будет запускаться автоматически при наличии изменений в вашем репозитории а также в Git будет виден статус последней сборки из дженкинса (успешно/неуспешно/в процессе).



Task 6: Databases. Remember everything.
Базы данных. Кто владеет информацией, тот владеет миром

Важные моменты:
    1. Основные понятия баз данных. Познакомиться с существующими базами данных. Различия SQL/NoSQL баз данных (Примеры)

Tasks:
    1. Развернуть в облаке контейнер с базой данных SQL (MySQL or PostgreSQL)
    2. Заполнить базу данных. Сделать две таблицы:
    • Students (ID; Student; StudentId);
    • Result (ID; StudentId; Task1; Task2; Task3; Task4);
Данные брать из:
https://docs.google.com/spreadsheets/d/1bJ6aDyDSBPAbck56ji6q98rw8S69i_cDymm4gN0vu3o/edit?ts=60c0e27d#gid=0
EXTRA: 2.1. Написать SQL скрипт, который будет заполнять базу данных и проверять на наличие уже существующих таблиц/записей.
3. Написать запрос который по вашей фамилии будет находить информацию по выполненным заданиям и выводить результат на экран.
    4. Сделайте dump базы данных, удалите существующую и восстановите из дампа.
    5. Написать Ansible роль для развертывания SQL или noSQL базы данных. Креды не должны храниться в GitHub.
EXTRA: 
    1. Прочитать про репликацию SQL и NoSQL.
    2. Написать Ansible роль для создания SQL/NoSQL кластера.
    3. Написать Pipeline для Jenkins который будет запускать ансибл плейбуки для SQL/NoSQL.



Task 7: Logging&Monitoring. Big Brother.
Мониторинг: Город засыпает просыпается ....
Tasks:
1. Zabbix:
1.1 Установить на сервер - сконфигурировать веб и базу 
1.2 Поставить на подготовленные ранее сервера или виртуалки заббикс агенты 
EXTRA 1.2.1: сделать это ансиблом
1.3 Сделать несколько своих дашбородов, куда вывести данные со своих триггеров (например мониторить размер базы данных из предыдущего задания и включать алерт при любом изменении ее размера - можно спровоцировать вручную)
1.4 Active check vs passive check - применить у себя оба вида - продемонстрировать.
1.5 Сделать безагентный чек любого ресурса (ICMP ping)
1.6 Спровоцировать алерт - и создать Maintenance инструкцию 
1.7 Нарисовать дашборд с ключевыми узлами инфраструктуры и мониторингом как и хостов так и установленного на них софта

2. ELK: 
Никто не забыт и ничто не забыто.
2.1 Установить и настроить ELK 
2.2 Организовать сбор логов из докера в ELK и получать данные от запущенных контейнеров
2.3 Настроить свои дашборды в ELK
EXTRA 2.4: Настроить фильтры на стороне Logstash (из поля message получить отдельные поля docker_container и docker_image)
2.5 Настроить мониторинг в ELK - получать метрики от ваших запущенных контейнеров
2.6 Посмотреть возможности и настройки

3. Grafana:
3.1 Установить Grafana интегрировать с установленным ELK
3.2 Настроить Дашборды
3.3 Посмотреть возможности и настройки
