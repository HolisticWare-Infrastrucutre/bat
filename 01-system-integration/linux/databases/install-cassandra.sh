#!/bin/bash

# Directories 					Description
# /var/lib/cassandra 			Data directories
# /var/log/cassandra 			Log directory
# /var/run/cassandra 			Runtime files
# /usr/share/cassandra 			Environment settings
# /usr/share/cassandra/lib 		JAR files
# /usr/bin 						Binary files
# /etc/cassandra 				Configuration files
# /etc/init.d 					Service startup script

cd /tmp


wget \
	--no-cookies --no-check-certificate \
	--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
	-O jdk-7u60-linux-i586.rpm \
	"http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-i586.rpm"
	
rpm -ivh dk-7u60-linux-i586.rpm




yum -y install \
	jna

# symbolic links	
alternatives --install /usr/bin/java java /usr/java/jre1.7.0_45/bin/java 20000	
alternatives --config java
java -version



cat /etc/yum.repos.d/datastax.repo

echo \
	"
	[datastax]
	name = DataStax Repo for Apache Cassandra
	baseurl = http://rpm.datastax.com/community
	enabled = 1
	gpgcheck = 0
	" \
	>> /etc/yum.repos.d/datastax.repo
	
cat /etc/yum.repos.d/datastax.repo
	

# Install Apache Cassandra 2
yum -y install dsc20	


#Configure the Apache Cassandra 2 Environment

# environment tweaks that enable Cassandra to run correctly:
export JAVA_HOME=/usr/java/jdk1.7.0_60/
export PATH=$PATH:$JAVA_HOME/bin/




# Get Cassandra Running
# Start-Up Cassandra
service cassandra start
# Check Cassandra Service Status
service cassandra status
# Enter the Cassandra Command Line
cqlsh

# if error
# Connection error: Could not connect to localhost:9160
# service iptables stop

iptables -A INPUT -p tcp --dport 7000 -j ACCEPT
iptables -A INPUT -p tcp --dport 7199 -j ACCEPT
iptables -A INPUT -p tcp --dport 9160 -j ACCEPT


iptables -L

service iptables save
service iptables restart