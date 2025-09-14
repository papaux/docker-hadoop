FROM papaux/hadoop-base:3.0.0-hadoop3.4.2-java11

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      python3.11

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9864

CMD ["/run.sh"]
