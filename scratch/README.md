# VividCortex "scratch" Docker container

Runs VividCortex agents in a Docker container, for off-host monitoring (see
[here](https://docs.vividcortex.com/getting-started/installing/#off-host-monitoring)).

To use, you should build a image for your environment:

	mkdir vcimage
	cd vcimage
	wget https://raw.githubusercontent.com/VividCortex/docker/master/scratch/Dockerfile
	wget https://raw.githubusercontent.com/VividCortex/docker/master/scratch/vividcortex.tar.xz
	docker build --force-rm --build-arg VC_API_TOKEN=xxxxxxxxxxxxxxxx -t vcimage ./
	cd ..
	rm -rf vcimage

You can get your API token from the host wizard in VividCortex as follows:
In your account from the Hosts page add a new host by clicking the "Add New
Host" button in the upper right. From "Where Is The Service You Want To
Monitor?" choose the "Containerized" option. From the "Agents API Token" box
copy the token and close the "Install VividCortex On A New Host" dialog.

At this point you should have a repository named "vcimage" in `docker images`.

Now create and start a container for your RDS host:

	docker run \
	  --env VC_HOSTNAME=myprettyhostname \
	  --env VC_DRV_MANUAL_HOST_URI='mysql://user:pass@domain.xyz:3306/db' \
	  --detach --interactive --tty --name=vividcortex vcimage

where:
* `VC_HOSTNAME`, optional, is a host name to use instead of Docker's random hex one.
* `VC_DRV_MANUAL_HOST_URI`, optional, is a comma-separated list of database URLs to monitor. You can still add hosts using VividCortex's web app. Database URL format:

	```
	<schema>://[<user>[:<password>]@]<host>:<port>[/<db>][?key1=value1&...]
	```
