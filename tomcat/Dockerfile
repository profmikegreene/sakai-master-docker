FROM tomcat:8.0-jre8
#this image sets
#CATALINA_HOME to /usr/local/tomcat
#JAVA_HOME to /usr/lib/jvm/java-1.8-openjdk/jre

ENV JAVA_OPTS="-server -d64 -Xms1024m -Xmx2048m -XX:NewSize=192m -XX:MaxNewSize=384m"
ENV JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
ENV JAVA_OPTS="$JAVA_OPTS -Dhttp.agent=Sakai"
ENV JAVA_OPTS="$JAVA_OPTS -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false"
ENV JAVA_OPTS="$JAVA_OPTS -Dsun.lang.ClassLoader.allowArraySyntax=true"
ENV JAVA_OPTS="$JAVA_OPTS -Djava.util.Arrays.useLegacyMergeSort=true"
ENV JAVA_OPTS="$JAVA_OPTS -Dsakai.demo=true"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+UseCompressedOops"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+DisableExplicitGC"
ENV JAVA_OPTS="$JAVA_OPTS -Dsakai.security=$CATALINA_HOME/sakai/"
ENV JAVA_OPTS="$JAVA_OPTS -Duser.timezone=US/Eastern"
ENV JAVA_OPTS="$JAVA_OPTS -Dsakai.cookieName=SAKAI2SESSIONID"
ENV JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
ENV JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=8089"
ENV JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.local.only=false"
ENV JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
ENV JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"

ENV PATH="$CATALINA_HOME/bin:$PATH"

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz
RUN tar -zxvf mysql-connector-java-5.1.36.tar.gz
RUN mkdir -p $CATALINA_HOME/shared/lib
RUN mv mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar $CATALINA_HOME/lib/mysql-connector-java-5.1.36-bin.jar
RUN rm mysql-connector-java-5.1.36.tar.gz
RUN rm -rf mysql-connector-java-5.1.36

RUN apt-get update && apt-get install -y mysql-client

COPY conf/context.xml $CATALINA_HOME/conf
COPY conf/server.xml $CATALINA_HOME/conf

COPY ./appstart.sh /usr/local/bin/appstart.sh
RUN chmod u+x /usr/local/bin/appstart.sh

ENTRYPOINT ["/usr/local/bin/appstart.sh"]
CMD ["catalina.sh", "run"]
