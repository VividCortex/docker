FROM alpine:3.8
ADD vividcortex.tar.xz /

WORKDIR /
ENTRYPOINT ["/usr/local/bin/vc-agent-007","-foreground","-forbid-restarts"]

ARG VC_API_TOKEN

ENV VC_API_TOKEN="${VC_API_TOKEN}"
