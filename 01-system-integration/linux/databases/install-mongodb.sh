#!/bin/bash

echo \
	"
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/i686/
gpgcheck=0
enabled=1
	" \
	 >> /etc/yum.repos.d/mongodb.repo
	 
cat	 /etc/yum.repos.d/mongodb.repo

# To install the latest stable version of MongoDB, issue the following command:
sudo yum install -y mongodb-org


# Start MongoDB.
# start the mongod process by issuing the following command:
sudo service mongod start

# Verify that MongoDB has started successfully
# verify that the mongod process has started successfully by checking the 
# contents of the log file at /var/log/mongodb/mongod.log for a line reading
# [initandlisten] waiting for connections on port <port>
# 
# where <port> is the port configured in /etc/mongod.conf, 27017 by default.
cat /var/log/mongodb/mongod.log 


# optionally ensure that MongoDB will start following a system reboot by 
# issuing the following command:

sudo chkconfig mongod on

