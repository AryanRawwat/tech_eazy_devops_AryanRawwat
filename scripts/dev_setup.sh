#!/bin/bash
exec > /var/log/user_data.log 2>&1
set -x

# Update OS
yum update -y

# Install Java 17 (compatible & available)
amazon-linux-extras enable corretto17
yum install -y java-17-amazon-corretto

# Install Maven via yum (skip zip fail)
yum install -y maven git

# Clone your GitHub repo
cd /home/ec2-user
git clone ${repo_url} app
cd app

# Build with Maven
mvn clean install

# Run app on port 80
nohup java -jar target/*.jar --server.port=80 &

# Shutdown instance after 1 hour
shutdown -h +60

