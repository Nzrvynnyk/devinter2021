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


### Set up Ubuntu server in localhost need 4gb RAM
add key Elasticsearch GPG in APT:
```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt install elasticsearch
```
change elasticsearch.yml add network.host

start elasticsearch ''sudo systemctl start elasticsearch''
and enable 
http://prntscr.com/19bfbeb
check services Elasticsearch 
curl -X GET "localhost:9200"
http://prntscr.com/19bfisf

### Install Kibana 
```
sudo apt install kibana
sudo systemctl enable kibana
sudo systemctl start kibana

```
change host seting and open open addres chack status KIbana
http://prntscr.com/19g6bwb

### install logstash 
sudo apt install logstash



### Get metricks Docker 
http://prntscr.com/19g6nwy




### Grafana
Install grafana in docker 
integrations with ELK
http://prntscr.com/19hak3j
add log dashboard 
http://prntscr.com/19hc6mr