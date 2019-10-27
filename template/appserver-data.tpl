#!/bin/bash
set -e

#do an update
sudo yum update -y

### setup JENKINS
### install JDK-8 and update JRE link
sudo yum -y install java-1.8.0-openjdk-devel.x86_64


## install tomcat
sudo yum install tomcat-webapps.noarch -y
service tomcat.service start


## install nodejs
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
sudo yum install nodejs -y
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install yarn -y

yarn --version
node -v 
npm -v 

