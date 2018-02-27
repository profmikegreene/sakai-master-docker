FROM maven:3.5.2-jdk-8
ENV MAVEN_OPTS="-Xms1024m -Xmx6000m -Djava.util.Arrays.useLegacyMergeSort=true"
ENV MAVEN_OPTS="$MAVEN_OPTS -Dmaven.tomcat.home=/usr/src/mymaven/target"
ENV MAVEN_OPTS="$MAVEN_OPTS -Dsakai.home=/usr/src/mymaven/target/target/sakai"
ENV MAVEN_OPTS="$MAVEN_OPTS  -Djava.net.preferIPv4Stack=true"
ENV MAVEN_OPTS="$MAVEN_OPTS -Dmaven.test.skip=true"
WORKDIR /usr/src/mymaven
