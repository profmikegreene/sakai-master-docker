# Sakai Master Dockerized

## Install

1. git clone this repo
1. cd to folder
1. This project uses sakai/master as a git submodule so do a git pull to get the latest .gitmodules file 
1. git submodule init to initialize the submodule
1. git submodule update
1. cd sakai/src
1. docker run -it --rm --name sakai -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven maven:3.5.2-jdk-8-alpine mvn clean install sakai:deploy -Dmaven.tomcat.home=../../tomcat -Djava.net.preferIPv4Stack=true -Dmaven.test.skip=true
1. docker-compose up

This starts containers for

* tomcat - to serve built sakai webapp
* mysql - to store sakai db
* phpmyadmin - GUI for sakai db
* maven - clone sakai source and build

git clones your chosen version (defaults to github master) of sakai into /sakai/src

maybe the maven image does nothing but run the maven commands. sakai is cloned in the tomcat folder and deployed?

## Workflow
1. docker-compose up
2. docker exec -it <sakai container name> /bin/bash
3. mvn clean install sakai:deploy -Dmaven.tomcat.home=$CATALINA_HOME -Djava.net.preferIPv4Stack=true -Dmaven.test.skip=true


how to use $catalina home on another container?

tomcat is on dnet?

need maven + mysql hello world so i don't have to test on sakai behemoth

How to declare which version of Sakai. Change some variable...

* local sakai fork cloned to /sakai/src
* master
* tagged releases
