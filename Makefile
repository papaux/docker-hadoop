DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch = 3.0.0-hadoop3.4.2-java11
DOCKER_USER = wxwmatt

base:
	docker build -t ${DOCKER_USER}/hadoop-base:$(current_branch) ./base

build:
	docker build -t ${DOCKER_USER}/hadoop-release:$(current_branch) ./hadoop-release
	docker build -t ${DOCKER_USER}/hadoop-base:$(current_branch) ./base
	docker build -t ${DOCKER_USER}/hadoop-namenode:$(current_branch) ./namenode
	docker build -t ${DOCKER_USER}/hadoop-datanode:$(current_branch) ./datanode
	docker build -t ${DOCKER_USER}/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t ${DOCKER_USER}/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t ${DOCKER_USER}/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t ${DOCKER_USER}/hadoop-submit:$(current_branch) ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} ${DOCKER_USER}/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} ${DOCKER_USER}/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-3.4.2/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} ${DOCKER_USER}/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} ${DOCKER_USER}/hadoop-base:$(current_branch) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} ${DOCKER_USER}/hadoop-base:$(current_branch) hdfs dfs -rm -r /input
