FROM ubuntu:trusty
RUN apt-get update && apt-get install -y python-pip mysql-client && pip install awscli

ARG MYSQL_CONTAINER_NAME
ENV MYSQL_CONTAINER_NAME $MYSQL_CONTAINER_NAME

ARG DIP
ENV DIP $DIP

ARG MYSQL_ADDRESS
ENV MYSQL_ADDRESS $MYSQL_ADDRESS

ARG MYSQL_USER
ENV MYSQL_USER $MYSQL_USER

ARG MYSQL_PASS
ENV MYSQL_PASS $MYSQL_PASS

ARG MYSQL_DB
ENV MYSQL_DB $MYSQL_DB

ADD src/backupaws.sh /backupaws.sh
RUN chmod +x /backupaws.sh
CMD ["/backupaws.sh"]