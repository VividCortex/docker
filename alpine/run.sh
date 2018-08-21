#!/bin/sh
set -e

echo "Checking to make sure VC_API_TOKEN is provided."
[ "${VC_API_TOKEN}" == "" ] && echo "VC_API_TOKEN not specified." && exit 1

# This part of the install has to happen on the fly because VC_API_TOKEN is required
# to install. 
sh install --token=${VC_API_TOKEN} --batch --init=None --static --proxy=dyn
rm -f install 
sed '1 a "log-max-size":"5",' /etc/vividcortex/global.conf > /etc/vividcortex/tempconf
sed '1 a "log-max-backups":"1",' /etc/vividcortex/tempconf > /etc/vividcortex/global.conf
rm -f /etc/vividcortex/tempconf && chmod 600 /etc/vividcortex/global.conf

# Start the Vividcortex monitoring agent
echo "Starting the VC agent."
/usr/local/bin/vc-agent-007 $@
