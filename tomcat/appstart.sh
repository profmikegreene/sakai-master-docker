#!/bin/bash
echo "Copying Sakai libraries"
cp /usr/local/tomcat/sakai/lib/* /usr/local/tomcat/lib/

# echo "Waiting for mysql"
# echo "Executing mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u${MYSQL_USER} -p"${MYSQL_PASSWORD}" &> /dev/null"
# until mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u${MYSQL_USER} -p"${MYSQL_PASSWORD}" &> /dev/null
# do
#   printf "."
#   sleep 1
# done

# echo -e "\nmysql ready"

catalina.sh run