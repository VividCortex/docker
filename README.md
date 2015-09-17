# VividCortex Docker container

Runs VividCortex agents in a Docker container, for off-host monitoring (see
[here](https://www.vividcortex.com/docs/installing/#off-host-monitoring)).

To use, you should set two environment variables:

* `DATABASE_URL` - A comma separated list of database URLs, each following this
format:

	```
	<schema>://[<user>[:<password>]@]<host>:<port>[/<db>][?key1=value1&...]
	```

* `VC_API_TOKEN` - Your VividCortex API token.

You can get your API token from the host wizard in VividCortex as follows:
In your account from the Hosts page add a new host by clicking the "Add New
Host" button in the upper right. From "Where Is The Service You Want To
Monitor?" choose the "Containerized" option. From the "Agents API Token" box
copy the token and close the "Install VividCortex On A New Host" dialog.


Original work kindly contributed by @phobologic. Thanks Mike!
