#!/bin/bash


sudo apt-get update


java -version

# If it returns "The program java can be found in the following packages", 
# Java hasn't been installed yet, so execute the following command:

sudo apt-get install \
	default-jre

# This will install the Java Runtime Environment (JRE). 


# If you instead need the Java Development Kit (JDK), which is usually needed 
# to compile Java applications 
# (for example Apache Ant, Apache Maven, Eclipse and IntelliJ IDEA 
# execute the following command:

sudo apt-get install \
	default-jdk

#===============================================================================
# OpenJDK

#Installation of Java Runtime Environment
# Install the openjdk-6-jre package using any installation method.
# sudo apt-get install \
#	openjdk-6-jre

# Install the openjdk-7-jre package using any installation method.
sudo apt-get install -y \
	openjdk-7-jre


#Browser plugin
# Install the icedtea6-plugin package using any installation method.
# Install the icedtea-7-plugin package using any installation method.
# This plugin works with the browsers: Epiphany, Firefox and Opera.

# On Konqueror, go to Settings → Configure Konqueror... and from menu select 
#Java & JavaScript, then tick Enable Java globally option.


# OpenJDK v6 & v7 SDK (Software Development Kit)

# In Java parlance the Java Development Kit (JDK) is sometimes used for SDK. 

# Install the openjdk-6-jdk package using any installation method.
# sudo apt-get install \
#	openjdk-6-jdk

# Install the openjdk-7-jdk package using any installation method.
sudo apt-get install \
	openjdk-7-jdk



#===============================================================================
# Oracle JDK

sudo apt-get install \
	python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
# or if you want JDK 8:
# sudo apt-get install oracle-java8-installer
#===============================================================================


sudo apt-get install -y \
	maven \
	git
	
git clone --recursive \
		https://github.com/mono/sharpen.git
cd sharpen/
mvn clean test

mvn install
		
		
		
		
		
			
	<plugin>
		<artifactId>maven-compiler-plugin</artifactId>
		<version>2.3.2</version>
		<configuration>
			<source>1.7</source>
			<target>1.7</target>
		</configuration>
	</plugin>


./src/target/sharpencore-0.0.1-SNAPSHOT-jar-with-dependencies.jar
./src/target/sharpencore-0.0.1-SNAPSHOT.jar
	
	
	
	
jar