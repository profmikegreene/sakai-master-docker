git submodule add https://github.com/sakaiproject/sakai.git sakai/src
git pull
git submodule init
git submodule update
docker run -it --rm --name sakai \
       -e MAVEN_OPTS='-Xms1024m -Xmx6000m -Djava.util.Arrays.useLegacyMergeSort=true' \
       -e JAVA_OPTS='-server -d64 -Xms1g -Xmx2g -Djava.awt.headless=true -XX:+UseCompressedOops -XX:+UseConcMarkSweepGC -XX:+DisableExplicitGC' \
       -v "$PWD/sakai/src":/usr/src/mymaven/library \
       -v "$PWD/sakai/.m2":/root/.m2 \
       -w /usr/src/mymaven \
       maven:3.5.2-jdk-8 mvn -T 2C clean install \
         -Dmaven.tomcat.home=/usr/src/mymaven/tomcat \
         -Djava.net.preferIPv4Stack=true \
         -Dmaven.test.skip=true \
         sakai:deploy
cp -a sakai/src/tomcat/lib tomcat/lib
ln -s tomcat/local.properties sakai/src/tomcat/sakai/local.properties
docker-compose build --no-cache
docker-compose up

docker run -it --rm --name sakai-maven \
       -v "$PWD/sakai/src":/usr/src/mymaven \
       -v "$PWD/sakai/.m2":/root/.m2 \
       DOCKERIMAGEID mvn -T 2C clean install \
         -f /usr/src/mymavn/library \
         sakai:deploy