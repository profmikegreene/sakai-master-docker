
docker build ./sakai

docker run -it --rm --name sakai-maven \
       -v "$PWD/sakai/src":/usr/src/mymaven/src \
       -v "$PWD/sakai/target":/usr/src/mymaven/target \
       -v "$PWD/sakai/.m2":/root/.m2 \
       DOCKERIMAGEID mvn -T 2C clean install sakai:deploy


cp -a sakai/src/tomcat/lib tomcat/lib
ln -s tomcat/local.properties sakai/src/tomcat/sakai/local.properties
docker-compose build --no-cache
docker-compose up


docker run -it --rm --name sakai-maven \
-v "$PWD/maven/src":/usr/src/mymaven/src \
-v "$PWD/maven/target":/usr/src/mymaven/target \
-v "$PWD/maven/.m2":/root/.m2 \
maven.sakai.local_1 mvn -T 2C \
-f src/reference/library \
clean install \
-Pcompile-skin -Dsakai.skin.target=duke-default \
sakai:deploy