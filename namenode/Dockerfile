FROM wxwmatt/hadoop-base:3.0.0-hadoop3.4.2-java11

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential \
      iputils-ping \
      wget

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      python3.11-dev \
      python3.11 \
      python3-venv \
      python3-pip

ENV VENV_DIR=/opt/venv
RUN python3 -m venv $VENV_DIR
ENV PATH="$VENV_DIR/bin:$PATH"


RUN pip3 install --no-cache-dir \
      wheel \
      setuptools \
      py4j \
      pyspark \
      numpy \
      pandas

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      gcc \
      git-core \
      libffi-dev

RUN pip3 install --no-cache-dir notebook

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libjpeg-dev \
      libpcre3 \
      libpcre3-dev \
      autoconf \
      libtool \
      pkg-config\
      zlib1g-dev \
      libssl-dev \
      libexpat1-dev \
      libxslt1.1\
      gnuplot

RUN pip3 install --no-cache-dir matplotlib

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD ["/run.sh"]
