FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

RUN \
    yum update -y && \
    yum install -y tar java-1.7.0-openjdk && \
    yum clean all && \
    # Install Kibana4
    mkdir -p /opt/kibana && \
    cd /opt/kibana && \
    curl -o /tmp/kibana4.tgz https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz && \
    tar zxvf /tmp/kibana4.tgz -C /opt/kibana --strip-components=1 && \
    rm -f /tmp/kibana4.tgz

ENV KIBANA_CONFIG /opt/kibana/config/kibana.yml

COPY bootstrap.sh /

EXPOSE 5601

ENTRYPOINT ["/bootstrap.sh"]