from centos:7

RUN yum -y install epel-release
RUN yum -y update && yum -y install wget tar java-1.8.0-openjdk-headless.x86_64

RUN wget http://packages.confluent.io/archive/3.3/confluent-3.3.0-2.11.tar.gz
RUN tar xfvz confluent-3.3.0-2.11.tar.gz
RUN rm -fr confluent-3.3.0-2.11.tar.gz

RUN yum -y install supervisor

WORKDIR /confluent-3.3.0

RUN echo 'ping localhost &' > /bootstrap.sh
RUN echo 'sleep infinity' >> /bootstrap.sh
RUN chmod +x /bootstrap.sh

CMD /bootstrap.sh

