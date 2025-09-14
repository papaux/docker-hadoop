FROM wxwmatt/hadoop-release:3.0.0-hadoop3.4.2-java11

ENV HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar
ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
