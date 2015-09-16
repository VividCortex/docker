# vivid-cortex docker container

Off host monitoring agent for https://www.vividcortex.com/

Built based on concepts from this: https://github.com/VividCortex/heroku-buildpack-vividcortex

To use, you should set two environment variables:

`DATABASE\_URL` - A comma separated list of database urls.
`VC\_API\_TOKEN` - Your Vivid Cortex API Token. You can get this by
doing the following:

```
In your account from the Hosts page add a new host by clicking the
"Add New Host" button in the upper right. From "Where Is The Service
You Want To Monitor?" choose the "Containerized" option. From the
"Agents API Token" box copy the token and close the "Install
VividCortex On A New Host" dialog.
```
