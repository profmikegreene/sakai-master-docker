# Sakai Github Dockerized

## Install

Use `git clone https://github.com/profmikegreene/sakai-master-docker.git` to grab this repository. 

You can then `cd` to the folder you cloned into and either `bash startup.sh` or run the individual commands manually.

You may want to adjust the CPU/RAM you give Docker and the variables in startup.sh:5 and tomcat/Dockerfile:6 if you have more or less resources to devote to the build. The defaults can consume up to 6GB of RAM and 4 CPUs.

This will take a while (mine took 62m), grab a coffee.

This creates a temporary container to do the maven build and starts containers for

* tomcat - to serve the built sakai 
* mysql - to store sakai db
* phpmyadmin - GUI for sakai db

Visit [http://localhost:7777/portal](http://localhost:7777/portal) or whatever port you chose as `TOMCAT_PORT` in .env


### todo
- how to restart tomcat without shutting container down if you want to dev and redeploy?


You `git` outside of docker

Sakai docker what if it came pre-built it was more about demo than master you can use tags or environmental variables to choose the branch but if you want the latest you’re going to have to rebuild it. That should speed up the deploy for new people

Take properties from nightly
https://codefresh.io/docker-tutorial/node_docker_multistage/?utm_medium=twitter-ad&utm_campaign=Twitter-Blog-Multi-stage&utm_source=twitter&utm_content=ad-3 Would this work?
