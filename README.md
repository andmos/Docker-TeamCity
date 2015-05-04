Docker-TeamCity
===
Docker-image for Team City.
Run:

		docker build -t andmos/teamcity .
		docker run --name teamcityserver -p 8111:8111 -dt andmos/teamcity


Navigate to http://localhost:8111 and run through the setup.
> To store data outsite container, use ``-v /data/teamcity:/data/teamcity``

> Another neat trick is to use a [dedicated storage container](https://medium.com/@ramangupta/why-docker-data-containers-are-good-589b3c6c749e):

>		docker create --name teamcitydata -v /data/teamcity -td debian
> 	docker run --name teamcityserver -p 8111:8111 --volumes-from=teamcitydata -dt andmos/teamcity

Start agent:

		docker build -t andmos/teamcityagent Agent/
		docker run --link teamcityserver:teamcityserver -e TEAMCITY_SERVER=http://teamcityserver:8111 -it -p 9090:9090 andmos/teamcityagent

> Mono-based agent is in the works.

Based on [ariya/centos6-teamcity-server](https://registry.hub.docker.com/u/ariya/centos6-teamcity-server/), but rewritten for the
official Java JRE image.
