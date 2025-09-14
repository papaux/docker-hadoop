FROM papaux/hadoop-base:3.0.0-hadoop3.4.2-java11

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      python3.11

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]
