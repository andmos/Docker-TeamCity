FROM java:jre
# Based on ariya/centos6-teamcity-agent 
ADD setup-agent.sh /setup-agent.sh

EXPOSE 9090

CMD sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /setup-agent.sh run"
