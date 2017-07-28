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
echo "Create bucket if not exist"
BUCKET_EXIST=$(aws s3 ls | grep $S3_BUCKET_NAME | wc -l)
if [ $BUCKET_EXIST -eq 0 ];
then
  aws s3 mb s3://$S3_BUCKET_NAME
fi
echo "Upload to bucket..."
# Upload the backup to S3 with timestamp
#aws s3 --region $AWS_DEFAULT_REGION cp /tmp/$BACKUP_NAME s3://$S3_BUCKET_NAME/$S3_FOLDER/$BACKUP_NAME
aws s3 --region $AWS_DEFAULT_REGION cp /tmp/$BACKUP_NAME s3://$S3_BUCKET_NAME/test/$BACKUP_NAME

# Clean up
rm /tmp/$BACKUP_NAME
