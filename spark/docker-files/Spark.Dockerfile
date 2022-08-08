## use Debian latest version
FROM debian:latest
LABEL maintainer=marcelo.ivan.rojas.hernandez@gmail.com

## initial directory
workdir /home/

## install necessary packages
RUN apt-get update && apt-get install -y curl vim wget software-properties-common ssh net-tools 
RUN apt-get install -y python3 python3-pip python3-numpy python3-matplotlib python3-scipy python3-pandas
#RUN apt-get install -y python3-simpy

## set python3 as default 
RUN update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1

## move files from download ../download directory at the host to /home in the container
COPY download/spark33-hadoop3.tgz /home/
COPY download/openjdk17-linux.tar.gz /home/

## configure java jdk 17
RUN tar -zxf openjdk17-linux.tar.gz -C /usr/local/
RUN rm openjdk17-linux.tar.gz 
RUN update-alternatives --install "/usr/bin/java"   "java"   "/usr/local/jdk-17/bin/java"  1
RUN update-alternatives --install "/usr/bin/javac"  "javac"  "/usr/local/jdk-17/bin/javac" 1

ENV JAVA_HONE="/usr/local/jdk-17"

## configure spark
RUN tar -zxf spark33-hadoop3.tgz -C /usr/local
RUN rm spark33-hadoop3.tgz 

RUN update-alternatives --install "/usr/sbin/start-master" "start-master" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/start-master.sh" 1
RUN update-alternatives --install "/usr/sbin/start-worker" "start-worker" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/start-worker.sh" 1
RUN update-alternatives --install "/usr/sbin/start-workers" "start-workers" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/start-workers.sh" 1
RUN update-alternatives --install "/usr/sbin/start-all" "start-all" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/start-all.sh" 1
RUN update-alternatives --install "/usr/sbin/stop-all" "stop-all" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/stop-all.sh" 1
RUN update-alternatives --install "/usr/sbin/stop-master" "stop-master" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/stop-master.sh" 1
RUN update-alternatives --install "/usr/sbin/stop-workers" "stop-workers" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/stop-workers.sh" 1
RUN update-alternatives --install "/usr/sbin/stop-worker" "stop-worker" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/stop-worker.sh" 1
RUN update-alternatives --install "/usr/sbin/spark-daemon.sh" "spark-daemon.sh" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/spark-daemon.sh" 1
RUN update-alternatives --install "/usr/sbin/spark-config.sh" "spark-config.sh" "/usr/local/spark-3.3.0-bin-hadoop3/sbin/spark-config.sh" 1
RUN update-alternatives --install "/usr/bin/spark-shell" "spark-shell" "/usr/local/spark-3.3.0-bin-hadoop3/bin/spark-shell" 1
RUN update-alternatives --install "/usr/bin/spark-class" "spark-class" "/usr/local/spark-3.3.0-bin-hadoop3/bin/spark-class" 1
RUN update-alternatives --install "/usr/bin/spark-sql" "spark-sql" "/usr/local/spark-3.3.0-bin-hadoop3/bin/spark-sql" 1
RUN update-alternatives --install "/usr/bin/spark-submit" "spark-submit" "/usr/local/spark-3.3.0-bin-hadoop3/bin/spark-submit" 1
RUN update-alternatives --install "/usr/bin/pyspark" "pyspark" "/usr/local/spark-3.3.0-bin-hadoop3/bin/pyspark" 1
RUN update-alternatives --install "/usr/bin/load-spark-env.sh" "load-spark-env.sh" "/usr/local/spark-3.3.0-bin-hadoop3/bin/load-spark-env.sh" 1

ENV SPARK_HOME="/usr/local/spark-3.3.0-bin-hadoop3"


## expose for ssh
EXPOSE 22


## expose for spark use
EXPOSE 7000-8080


## expose for slave webui
EXPOSE 8081












