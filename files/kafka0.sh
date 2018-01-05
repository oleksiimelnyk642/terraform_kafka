#!/bin/bash
export NODE_IP=`hostname -I`
export SERVER_PROPERTIES="/home/ec2-user/kafka_2.11-1.0.0/config/server.properties"
export HOST_NAME="broker0"
export ZOOKEEPER_IP="10.0.1.150"

yum remove java -y
yum install java-1.8.0-openjdk -y
cd /home/ec2-user
mkdir kafka-logs
chown -R ec2-user /home/ec2-user/kafka-logs
wget http://apache.cp.if.ua/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz
chown -R ec2-user /home/ec2-user/kafka_2.11-1.0.0
echo "${NODE_IP} ${HOST_NAME}" | sudo tee --append /etc/hosts > /dev/null


sed -i "/#listeners=PLAINTEXT:\/\/:9092/c\listeners=PLAINTEXT:\/\/:9092"     ${SERVER_PROPERTIES}
sed -i "/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/c\advertised.listeners=PLAINTEXT:\/\/${HOST_NAME}:9092"       ${SERVER_PROPERTIES}
sed -i "/log.dirs=\/tmp\/kafka-logs/c\log.dirs=\/home\/ec2-user\/kafka-logs"       ${SERVER_PROPERTIES}
sed -i "/zookeeper.connect=localhost:2181/c\zookeeper.connect=${ZOOKEEPER_IP}:2181"             ${SERVER_PROPERTIES}
