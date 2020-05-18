# VividCortex Alpine Docker container

Runs VividCortex agents in an [Alpine Linux](https://www.alpinelinux.org/) Docker container, for off-host monitoring; see
[here](https://docs.vividcortex.com/getting-started/off-host-installation/) for more detailis about off-host configuration requirements for your database. More general container installation documentation can be found [here](https://docs.vividcortex.com/getting-started/containerized-installation/).

To use, you should build a image for your environment:

	docker build --force-rm --build-arg VC_API_TOKEN=xxxxxxxxxxxxxxxx -t vcimage \
	  https://raw.githubusercontent.com/VividCortex/docker/master/alpine/Dockerfile

To get your API token, open the DPM application, choose the environment in which you'd like to add this host, and select "Add New Host" on the Inventory page. Then click "Containerized," which will display your token. Do not share or store it insecurely.

**You can specify VC_API_TOKEN at build time or run time.** If you do not include `VC_API_TOKEN` as a build argument the container will build without a token. At runtime, you must include it as an environment variable.

At this point you should have a repository named "vcimage" in `docker images`.

Now create and start a container for your RDS host:

	docker run \
	  --env VC_API_TOKEN=xxxxxxxxxxxxxxxx \
	  --env VC_HOSTNAME=myprettyhostname \
	  --env VC_DRV_MANUAL_HOST_URI='mysql://user:pass@domain.xyz:3306/db' \
	  --detach --interactive --tty --name=vividcortex vcimage

where:
* `VC_API_TOKEN` is an API token found in the Add New Host wizard, described above. It is required here if not provided when the container is built.
* `VC_HOSTNAME`, optional, is a host name to use instead of Docker's random hex one. We strongly recommend that you use this option so that restarting the container will not create a new host in DPM.
* `VC_DRV_MANUAL_HOST_URI`, optional, is a comma-separated list of database URLs to monitor. You can still add hosts using VividCortex's web app. Database URL format:

	```
	<schema>://[<user>[:<password>]@]<host>:<port>[/<db>][?key1=value1&...]
	```

Original work kindly contributed by @phobologic. Thanks Mike!
