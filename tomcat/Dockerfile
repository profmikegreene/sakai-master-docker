FROM tomcat:8.5-jre8-alpine
#this image sets
#CATALINA_HOME to /usr/local/tomcat
#JAVA_HOME to /usr/lib/jvm/java-1.8-openjdk/jre

ENV JAVA_OPTS="-server -Xms1024m -Xmx2048m -XX:NewSize=192m -XX:MaxNewSize=384m"
ENV JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
ENV JAVA_OPTS="$JAVA_OPTS -Dhttp.agent=Sakai"
ENV JAVA_OPTS="$JAVA_OPTS -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false"
ENV JAVA_OPTS="$JAVA_OPTS -Dsun.lang.ClassLoader.allowArraySyntax=true"
ENV JAVA_OPTS="$JAVA_OPTS -Djava.util.Arrays.useLegacyMergeSort=true"
ENV JAVA_OPTS="$JAVA_OPTS -Dsakai.demo=true"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+UseCompressedOops"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+DisableExplicitGC"
ENV PATH="$CATALINA_HOME/bin:$PATH"

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz
RUN tar -zxvf mysql-connector-java-5.1.36.tar.gz
RUN mkdir -p $CATALINA_HOME/shared/lib
RUN mv mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar $CATALINA_HOME/lib/mysql-connector-java-5.1.36-bin.jar
RUN rm mysql-connector-java-5.1.36.tar.gz
RUN rm -rf mysql-connector-java-5.1.36

COPY conf/context.xml $CATALINA_HOME/conf
COPY conf/server.xml $CATALINA_HOME/conf

#COPY lib/* $CATALINA_HOME/lib/
#

COPY ./wait-for-it.sh /usr/local/bin/wait-for-it.sh
