FROM alpine:3.8
MAINTAINER VividCortex <containers@vividcortex.com>
LABEL app=vividcortex

# How to use:
## docker build --force-rm -t vcimage https://raw.githubusercontent.com/VividCortex/docker/master/alpine/Dockerfile
#opt1# default hostname : docker run --env VC_API_TOKEN=xxxxxxxxx --detach --interactive --tty --name=vividcortex vcimage
#opt2# override hostname: docker run --env VC_HOSTNAME=mycontainer --env VC_API_TOKEN=xxxxxxxxx --detach --interactive --tty --name=vividcortex vcimage
#opt3# monitor RDS      : docker run --env VC_HOSTNAME=mycontainer --env VC_DRV_MANUAL_HOST_URI=mysql://user:pass@domain.xyz:3306/db --env VC_API_TOKEN=xxxxxxxxx --detach --interactive --tty --name=vividcortex vcimage
## docker ps | grep -q vividcortex && echo "success!"
## shell in container: docker exec --interactive --tty vividcortex /bin/sh
## REMOVE CONTAINER AND IMAGE: docker rm --force vividcortex; docker rmi --force vcimage

WORKDIR /

ADD ./run.sh /

RUN chmod +x /run.sh && \
    apk update && apk add --no-cache openssl ca-certificates wget && \
    rm -f install && \
    wget https://download.vividcortex.com/install

CMD [ "sh", "/run.sh"]
