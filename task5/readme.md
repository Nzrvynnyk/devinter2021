Tasks:
1. Установить Jenkins (Jenkins должен быть установлен  в Docker контейнере).
2. Установить необходимые плагины (если потребуются на ваше усмотрение).
3. Настроить несколько билд агентов.
4. Создать Freestyle project. Который будет в результате выполнения на экран выводить текущее время.
5. Создать Pipeline который будет на хосте выполнять команду docker ps -a.
6. Создать Pipeline который будет выкачивать из вашего репозитория код и будет собирать докер образ из вашего Dockerfile (который вы писали во время знакомства с докером).
7. Передать переменную PASSWORD=QWERTY! В зашифрованном виде в докер контейнер.
 
EXTRA:
1. Написать pipeline который будет на дополнительной виртуальной машине запускать докер контейнер из вашего докерфайла.
2. Написать ансибл скрипт который будет разворачивать дженкинс.
3. Развернуть локальный docker registry загрузить в него докер образ, выгрузить докер образ из docker registry и запустить контейнер на окружении (с использованием Jenkinsfile)
4. Настроить двухстороннюю интеграцию между Jenkins и вашим Git репозиторием. Jenkins проект будет запускаться автоматически при наличии изменений в вашем репозитории а также в Git будет виден статус последней сборки из дженкинса (успешно/неуспешно/в процессе).


### Task 1 Install Jenkis
```
sudo docker pull jenkins:2.60.3
sudo docker run -d -p 8080:8080 -p 50000:50000 jenkins:2.60.3
sudo docker ps 
sudo docker logs 5d38e97cd017  
```
copy a password to proceed to installation                                                     
install plugins, and created first Admin user
http://prntscr.com/16vd1hu
http://prntscr.com/16vd647

### Add build agent used Launch agent by conncting in to the master 
```
sudo yum -y install java-1.8.0-openjdk git &&
curl http://3.121.223.225:8090/jnlpJars/agent.jar --output agent.jar &&    
java -jar agent.jar -jnlpUrl http://3.121.223.225:8090/computer/Node1/jenkins-agent.jnlp -secret 963f62d201682572efebc0de1750b2faa6a64e3c0888eb7e6d5e41aadbb39fcb -workDir "/home/ec2-user/aws"
```
http://prntscr.com/16vz3xn
http://prntscr.com/16vz9ap

### Install plugin SSH AGENT
connect a new node2 lauch via SSH
use ssh to create build agent 
http://prntscr.com/16vw1mn


### Date and time

http://prntscr.com/16vio4p

### Pipeline docker ps -a 
http://prntscr.com/16w5unm
```
pipeline {
    agent { label 'main' }
    stages {
        stage('Build') {
            steps {
                sh('docker ps -a')
                sh '''
                    echo "Done"
                    ls -lah
                '''
            }
        }
    }
}
```
### Docker image from task4 
http://prntscr.com/16wr5h1
```
pipeline {
    agent {label 'aws' }
    stages {
        stage('install Docker') {
            steps {
                sh("sudo yum install docker -y")
                sh("sudo service docker start")
                sh('sudo usermod -a -G docker ec2-user')
                sh('sudo chown $USER /var/run/docker.sock')
                echo "End of Stage Build..."
            }
        }
        stage('Run Docker container'){
            steps {
               sh("sudo docker pull nvynnyk/devintership:latest")
               sh("sudo docker run -d -it -p 80:80 nvynnyk/devintership")
               echo "End build"
           }
       }
   }
}
```
### ADD secrets ENV 
Add Global credentials with secret text
http://prntscr.com/16xow94
add Evironment.
run docker 
```docker run -d -it -e $EXAMPLE_KEY
```
```
pipeline {
    agent {label 'aws' }
    environment {
    EXAMPLE_KEY = credentials("PASSWORD") // Secret value is 'sec%ret'
  }
    stages {
        stage('install Docker') {
            steps {
                sh("sudo yum install docker -y")
                sh("sudo service docker start")
                sh('sudo usermod -a -G docker ec2-user')
                sh('sudo chown $USER /var/run/docker.sock')
                echo "End of Stage Build..."
            }
        }
        stage('Run Docker container'){
            steps {
               sh("sudo docker pull nvynnyk/devintership:latest")
               sh("echo $EXAMPLE_KEY")
               sh("sudo docker run -d -it -e $EXAMPLE_KEY -p 80:80 nvynnyk/devintership")
               echo "End build"
           }
       }
   }
}
```
