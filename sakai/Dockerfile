FROM maven:3.5.2-jdk-8-alpine

ENV MAVEN_OPTS="-Xms512m -Xmx1024m -Djava.util.Arrays.useLegacyMergeSort=true" \
    PATH="$PATH:$MAVEN_HOME/bin"

COPY config.sh /usr/local/bin
RUN chmod u+x /usr/local/bin/config.sh

CMD ["mvn"]