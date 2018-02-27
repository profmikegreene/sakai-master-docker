
docker build ./sakai

docker run -it --rm --name sakai-maven \
       -v "$PWD/sakai/src":/usr/src/mymaven \
       -v "$PWD/sakai/.m2":/root/.m2 \
       DOCKERIMAGEID mvn -T 2C clean install sakai:deploy


cp -a sakai/src/tomcat/lib tomcat/lib
ln -s tomcat/local.properties sakai/src/tomcat/sakai/local.properties
docker-compose build --no-cache
docker-compose up

