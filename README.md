### Be carefull, running this Terraform scripts will cost you money !!!


Steps to raise 3 Kafka nodes and 1 Zookeeper node on AWS by Terraform:

1.	Need to export variables in shell: 

export AWS_ACCESS_KEY_ID="myAccessKey"

export AWS_SECRET_ACCESS_KEY="mySecretAccessKey"

export AWS_DEFAULT_REGION="us-east-2" 

### Change values in variables to yours.

2.  Go to the folder, where you want to clone this repository and do command:
    git clone https://github.com/oleksiimelnyk642/terraform_kafka.git
    
3.  Install Terraform, you can use this link for it - https://linuxacademy.com/community/posts/show/topic/18181-can-somebody-explain-how-to-install-terraform

4.  Do command - terraform init

5. In file variables.tf, please, change aws_key_pair to your SSH key name (which should already been created in your AWS account). Also you can change other variables, like ami, aws_instance_type and my_tag.

6.  Do command - terraform plan
### It will show you what resources will be created, after you run terraform apply in the next command.

7.  Do command - terraform apply
### It will take some time, while all resources will be raised and configured

5.  Login to your AWS account, go to needed AWS region and create an Elastic Ip

6.  Attach Elastic IP to zookeeper node

7.  Login via SSH to Zookeeper node and do commands:
cd kafka_2.11-1.0.0
nohup bin/zookeeper-server-start.sh config/zookeeper.properties &

8.  Login via SSH to each Kafka broker node and do command:
bin/kafka-server-start.sh config/server.properties &
