#!/bin/bash

cd /home/ec2-user
wget http://apache.cp.if.ua/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz
chown -R ec2-user /home/ec2-user/kafka_2.11-1.0.0
