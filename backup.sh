#!/bin/bash
clear
export $(cat .env | xargs)
DIP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $MYSQL_CONTAINER_NAME);
#echo $DIP
echo "
DIP=$DIP" >> .env
docker exec -it $MYSQL_CONTAINER_NAME iptables -L -n
docker exec -it $MYSQL_CONTAINER_NAME netstat -npl | grep 3306
docker-compose down
docker-compose build
docker-compose up
docker-compose down
echo "SUCCESSFULL DONE :)"