FROM tomcat:8.5.24-jre8-alpine
#this image sets
#CATALINA_HOME to /usr/local/tomcat
#JAVA_HOME to /usr/lib/jvm/java-1.8-openjdk/jre

ENV JAVA_OPTS="-server -Xms2048m -Xmx2048m -XX:NewSize=192m -XX:MaxNewSize=384m -Djava.awt.headless=true -Dhttp.agent=Sakai -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dsun.lang.ClassLoader.allowArraySyntax=true -Djava.util.Arrays.useLegacyMergeSort=true -Dsakai.demo=true"
ENV PATH="$CATALINA_HOME/bin:$PATH"

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz
RUN tar -zxvf mysql-connector-java-5.1.36.tar.gz
RUN mkdir -p $CATALINA_HOME/shared/lib
RUN mv mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar $CATALINA_HOME/lib/mysql-connector-java-5.1.36-bin.jar
RUN rm mysql-connector-java-5.1.36.tar.gz
RUN rm -rf mysql-connector-java-5.1.36

COPY conf/context.xml $CATALINA_HOME/conf
COPY conf/server.xml $CATALINA_HOME/conf

#RUN mkdir $CATALINA_HOME/sakai
#RUN mkdir $CATALINA_HOME/components
#RUN mkdir $CATALINA_HOME/endorsed

#COPY sakai/local.properties $CATALINA_HOME/sakai
COPY lib/* $CATALINA_HOME/lib/
#COPY local.properties $CATALINA_HOME/sakai


#RUN echo $'\nurl@javax.sql.BaseDataSource=jdbc:mysql://${MYSQL_HOST}:3306/${MYSQL_DATABASE}?characterEncoding=UTF-8&useServerPrepStmts=false&cachePrepStmts=true&prepStmtCacheSize=4096&prepStmtCacheSqlLimit=4096\nusername@javax.sql.BaseDataSource=${MYSQL_USER}\npassword@javax.sql.BaseDataSource=${MYSQL_PASSWORD}\n'\
#>> $CATALINA_HOME/sakai/local.properties
#


#COPY entrypoint.sh /
#RUN chmod u+x /entrypoint.sh
###
# Start container
###
#ENTRYPOINT ["/entrypoint.sh"]
