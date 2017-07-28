#!/bin/bash
DATE=$(date +"%Y-%m-%d-%H-%M-%S");
echo DATE - $DATE;
echo Docker Conteiner IP - $DIP;
echo MYSQL IP - $DIP;
echo MYSQL_DB - $MYSQL_DB;
readonly BACKUP_SQL=$MYSQL_DB$DATE.sql
readonly BACKUP_NAME=$BACKUP_SQL.tar.gz
echo BACKUP_NAME - $BACKUP_NAME;
echo Create backup....
echo "mysqldump to /tmp/$BACKUP_NAME ...."
mysqldump -u root -p123 -B db_yupe -h 172.26.0.2  | gzip > /tmp/$BACKUP_NAME
ls -la /tmp
echo Backup $BACKUP_NAME created!
