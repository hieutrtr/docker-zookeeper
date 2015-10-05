# DOCKER-VERSION 1.0.1
# VERSION        0.5

FROM debian:jessie
MAINTAINER Justin Plock <justin@plock.net>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.6 /opt/zookeeper \
    && mkdir -p /tmp/zookeeper

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ADD config/zoo.cfg /opt/zookeeper/conf/zoo.cfg
ADD config/myid /tmp/zookeeper/myid
ADD start.sh /opt/zookeeper/start.sh

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

CMD ["/opt/zookeeper/start.sh"]
