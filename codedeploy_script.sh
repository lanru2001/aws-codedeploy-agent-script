#!/bin/bash
yum update -y
yum install ruby -y
yum install wget -y

#To clean the AMI of any previous agent caching information, run the following script:
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y
cd /home/ec2-user

# install code deploy agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-2.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
systemctl  status codedeploy-agent
systemctl start codedeploy-agent

# install NGINX
yum install nginx -y
systemctl start nginx
systemctl enable nginx
