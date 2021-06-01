ARG SPARK_IMAGE=gcr.io/spark-operator/spark:v2.4.4
# ARG SPARK_IMAGE=gcr.io/spark-operator/spark:v3.1.1

FROM ${SPARK_IMAGE}

RUN apk --update add coreutils && mkdir /tmp/spark-events

# https://github.com/apache/spark/blob/41be5125a1581a1c1dd611a98e823f356419f137/sbin/spark-daemon.sh#L30
ENV SPARK_NO_DAEMONIZE TRUE

ENTRYPOINT ["/opt/spark/sbin/start-history-server.sh"]
