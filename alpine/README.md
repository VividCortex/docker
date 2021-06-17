# VividCortex Alpine Docker container

Runs VividCortex agents in an [Alpine Linux](https://www.alpinelinux.org/) Docker container, for off-host monitoring; see
[here](https://docs.vividcortex.com/getting-started/off-host-installation/) for more detailis about off-host configuration requirements for your database. More general container installation documentation can be found [here](https://docs.vividcortex.com/getting-started/containerized-installation/).

To use, build a image for your environment:

	docker build --force-rm -t vcimage \
	  https://raw.githubusercontent.com/VividCortex/docker/master/alpine/Dockerfile

At this point you should have a repository named "vcimage" in `docker images`.

**You can specify VC_API_TOKEN at build time or run time.** This sample code assumes the containter will be built without a token and that the token will be provided as an environment variable at run time.

To get your API token, open the DPM application, choose the environment in which you'd like to add this host, and select "Add New Host" on the Inventory page. Then click "Containerized," which will display your token. Do not share or store it insecurely.

Now create and start a container for your RDS host:

	docker run \
	  --env VC_API_TOKEN=xxxxxxxxxxxxxxxx \
	  --env VC_HOSTNAME=myprettyhostname \
	  --env VC_DRV_MANUAL_HOST_URI='mysql://user:pass@domain.xyz:3306/db' \
	  --detach --interactive --tty --name=vividcortex vcimage

where:
* `VC_API_TOKEN` is an API token found in the Add New Host wizard, described above.
* `VC_HOSTNAME`, optional, is a host name to use instead of Docker's random hex one. We strongly recommend that you use this option so that restarting the container will not create a new host in DPM.
* `VC_DRV_MANUAL_HOST_URI` is a comma-separated list of database URLs to monitor. For a complete description of host URIs [see our documentation here](https://docs.vividcortex.com/getting-started/advanced-installation/#database-uri); you will use the same format for VC_DRV_MANUAL_HOST_URI.
* `VC_DRV_MANUAL_QUERY_CAPTURE` is the method the agent will use for monitoring queries. The available query capture methods [are here](https://docs.vividcortex.com/getting-started/advanced-installation/#query-capture-method). It is not currently possible to specify multiple capture methods in a single container; if you have two or database types which do not share a capture method you will need to create two containers, which must run on two different pods (the supervisor agents will conflict otherwise).
