git submodule add https://github.com/sakaiproject/sakai.git sakai/src
git pull
git submodule init
git submodule update
docker run -it --rm -e MAVEN_OPTS='-Xms2048m -Xmx4096m -Djava.util.Arrays.useLegacyMergeSort=true' \
       --name sakai -v "$PWD/sakai/src":/usr/src/mymaven -w /usr/src/mymaven \
       maven:3.5.2-jdk-8 mvn clean install sakai:deploy \
       -Dmaven.tomcat.home=/usr/src/mymaven/tomcat \
       -Djava.net.preferIPv4Stack=true \
       -Dmaven.test.skip=true
mv sakai/src/tomcat/* tomcat/
docker-compose up