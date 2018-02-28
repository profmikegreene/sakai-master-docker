#!/bin/bash

echo "Waiting for mysql"
until mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u${MYSQL_USER} -p"${MYSQL_PASSWORD}" &> /dev/null
do
  printf "."
  sleep 1
done

echo -e "\nmysql ready"

echo "Waiting for maven"
# STATUS=$?
# if [ $STATUS -eq 0 ]; then
# echo "Deployment Successful"
# else
# echo "Deployment Failed"
# fi

echo -e "\nmaven ready"