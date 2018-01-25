git submodule add https://github.com/sakaiproject/sakai.git
git pull
git submodule init
git submodule update
cd sakai/src
docker run -it --rm -e MAVEN_OPTS='-Xms2048m -Xmx4096m -Djava.util.Arrays.useLegacyMergeSort=true' \
       --name sakai -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven \
       maven:3.5.2-jdk-8 mvn clean install sakai:deploy \
       -Dmaven.tomcat.home=../../tomcat \
       -Djava.net.preferIPv4Stack=true \
       -Dmaven.test.skip=true
docker-compose up