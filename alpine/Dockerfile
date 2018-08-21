FROM alpine:3.8
MAINTAINER VividCortex <containers@vividcortex.com>
LABEL app=vividcortex

WORKDIR /

ADD ./run.sh /

RUN chmod +x /run.sh && \
    apk update && apk add --no-cache openssl ca-certificates wget && \
    rm -f install && \
    wget https://download.vividcortex.com/install

ENTRYPOINT [ "/run.sh", "-foreground", "-forbid-restarts" ]
