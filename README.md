Docker-TeamCity
===
Docker-image for Team City.
Run: 

		docker build -t andmos/teamcity .
		docker run --name teamcityserver -p 8111:8111 -dt andmos/teamcity 
		

Navigate to http://localhost:8111 and run through the setup.
> To store data outsite container, use ``-v /data/teamcity:/data/teamcity``

Start agent: 

		docker build -t andmos/teamcityagent Agent/
		docker run --link teamcityserver:teamcityserver -e TEAMCITY_SERVER=http://teamcityserver:8111 -it -p 9090:9090 andmos/teamcityagent


Based on [ariya/centos6-teamcity-server](https://registry.hub.docker.com/u/ariya/centos6-teamcity-server/), but rewritten for the
official Java JRE image. 
