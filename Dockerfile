FROM java:jre
# Based on ariya/centos6-teamcity-server 

ENV TEAMCITY_DATA_PATH /data/teamcity
ENV TEAMCITY_PACKAGE TeamCity-8.1.5.tar.gz
ENV TEAMCITY_DOWNLOAD http://download.jetbrains.com/teamcity

RUN wget $TEAMCITY_DOWNLOAD/$TEAMCITY_PACKAGE && \
    tar zxf $TEAMCITY_PACKAGE -C /opt && \
    rm -rf $TEAMCITY_PACKAGE

VOLUME  ["/data/teamcity"]
EXPOSE 8111

CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
