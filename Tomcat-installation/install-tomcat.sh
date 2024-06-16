#!/bin/bash
# Use this script to install tomcat in rehat servers
echo delete the failed version of tomcat
sudo rm -rf /opt/tomcat9
echo assign a hostname to your server 
sudo hostname tomcat
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install java-11-openjdk-devel -y

# Download tomcat software and extract it.
sudo yum install wget unzip -y

sudo wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.24/bin/apache-tomcat-10.1.24.tar.gz
sudo tar -xvf apache-tomcat-10.1.24.tar.gz
sudo rm apache-tomcat-10.1.24.tar.gz
sudo mv apache-tomcat-10.1.24 tomcat
sudo chmod 777 -R /opt/tomcat
sudo chown ec2-user -R /opt/tomcat
sh /opt/tomcat/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update -y
starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 


#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat/conf/server.xml
vi /opt/tomcat/webapps/manager/META-INF/context.xml
vi /opt/tomcat/conf/tomcat-user.xml  # to add user

	<user username="landmark" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat/conf/context.xml

 vi /opt/tomcat/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
