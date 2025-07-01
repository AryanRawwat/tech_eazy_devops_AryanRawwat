#!/bin/bash
exec > /var/log/user_data.log 2>&1
set -x

yum update -y

# Install Java 21
yum install -y java-21-amazon-corretto

# Install Maven
yum install -y maven git

# Clone GitHub repo
cd /home/ec2-user
git clone ${repo_url} app
cd app

# Build and run the application
mvn clean install

# Run the app on port 80
nohup java -jar target/*.jar --server.port=80 &

# Shutdown after 1 hour to save cost
shutdown -h +60

