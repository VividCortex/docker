#!/bin/bash

INFILE=.api_token
if [ ! -f "$INFILE" ]; then
	echo "$INFILE does not exist, please retrieve from LastPass"
	exit 1
fi

VC_API_TOKEN=$(< $INFILE)
docker run --env VC_API_TOKEN="${VC_API_TOKEN}" --detach --interactive --tty --name=vividcortex vcimage
