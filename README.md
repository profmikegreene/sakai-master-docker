# Sakai Github Dockerized

## Install

`git clone https://github.com/profmikegreene/sakai-master-docker.git` to grab this repository.

`cd` to the folder you cloned into.

Run the startup.sh script or run the commands individually
`bash startup.sh`

Note: If you cloned this directory under a different name, the startup.sh script won't work as the docker commands use sakaimasterdocker as the root image name. Review startup.sh if you receive docker image not found errors.

Note: On `docker-compose up` you will get a maven build failure. I do not know how to prevent maven from starting on docker-compose up while still being built for all the previous builds.

You may want to adjust the CPU/RAM you give Docker and the variables in startup.sh:5 and tomcat/Dockerfile:6 if you have more or less resources to devote to the build. The defaults can consume up to 6GB of RAM and 4 CPUs.

This will take a while (mine took 62m), grab a coffee.

This creates a temporary container to do the maven build and starts containers for

* tomcat - to serve the built sakai
* mysql - to store sakai db
* phpmyadmin - GUI for sakai db

Visit [http://localhost/portal](http://localhost/portal) or whatever localhost:port/portal if you chose another port as `TOMCAT_PORT` in .env


### todo
- how to restart tomcat without shutting container down if you want to dev and redeploy?

### blah
You `git` outside of docker

Sakai docker what if it came pre-built it was more about demo than master you can use tags or environmental variables to choose the branch but if you want the latest you’re going to have to rebuild it. That should speed up the deploy for new people

Take properties from nightly
https://codefresh.io/docker-tutorial/node_docker_multistage/?utm_medium=twitter-ad&utm_campaign=Twitter-Blog-Multi-stage&utm_source=twitter&utm_content=ad-3 Would this work?

Use a multistage build to merge maven and tomcat together? 
- I like having them separated because you could run maven commands independantly.
- perhaps it would be better to put them on the same image and then you could alias mvn clean install sakai:deploy to include a tomcat restart?


ignore/src contains a sakaiproject/sakai git clone

what does maven/target/lib look like after a sakai:deploy? Do any of the original binaries remain unchanged?
