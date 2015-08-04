FROM java:8

MAINTAINER Krzysztof Grodzicki kgrodzicki@gmail.com

RUN cd /tmp && \
    wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.7.0/mule-standalone-3.7.0.tar.gz && \
    echo "6814d3dffb5d8f308101ebb3f4e3224a mule-standalone-3.7.0.tar.gz" | md5sum -c - && \
    tar zxvf mule-standalone-3.7.0.tar.gz && \
    mv mule-standalone-3.7.0 /opt/ && \
    ln -s /opt/mule-standalone-3.7.0 /opt/mule && \
    rm /tmp/mule-standalone-3.7.0.tar.gz

ENV MULE_HOME /opt/mule

WORKDIR /opt/mule

VOLUME ["/opt/mule/apps"]

CMD ["/opt/mule/bin/mule"]
