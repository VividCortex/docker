FROM alpine:3.8
MAINTAINER VividCortex <containers@vividcortex.com>
LABEL app=vividcortex

# How to use:
## docker build --force-rm --build-arg VC_API_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -t vcimage https://raw.githubusercontent.com/VividCortex/docker/master/alpine/Dockerfile
#opt1# default hostname : docker run --detach --interactive --tty --name=vividcortex vcimage
#opt2# override hostname: docker run --env VC_HOSTNAME=mycontainer --detach --interactive --tty --name=vividcortex vcimage
#opt3# monitor RDS      : docker run --env VC_HOSTNAME=mycontainer --env VC_DRV_MANUAL_HOST_URI=mysql://user:pass@domain.xyz:3306/db --detach --interactive --tty --name=vividcortex vcimage
## docker ps | grep -q vividcortex && echo "success!"
## shell in container: docker exec --interactive --tty vividcortex /bin/sh
## REMOVE CONTAINER AND IMAGE: docker rm --force vividcortex; docker rmi --force vcimage

ARG VC_API_TOKEN

WORKDIR /
ENTRYPOINT ["/usr/local/bin/vc-agent-007","-foreground","-forbid-restarts"]

# verify VC_API_TOKEN set
# openssl for https
# download, install
# cap logs

RUN test -n "${VC_API_TOKEN}" && \
    apk update && apk add --no-cache openssl ca-certificates wget && \
    rm -f install && \
    wget https://download.vividcortex.com/install && \
    sh install --token=${VC_API_TOKEN} --batch --init=None --static --proxy=dyn && \
    rm -f install && \
    sed '1 a "log-max-size":"5",' /etc/vividcortex/global.conf > /etc/vividcortex/tempconf && \
    sed '1 a "log-max-backups":"1",' /etc/vividcortex/tempconf > /etc/vividcortex/global.conf && \
    rm -f /etc/vividcortex/tempconf && chmod 600 /etc/vividcortex/global.conf
