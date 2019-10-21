FROM gcr.io/docker-images-180022/base/alpine:3.8
ADD scratch/vividcortex.tar.xz /

WORKDIR /
ENTRYPOINT ["/usr/local/bin/vc-agent-007","-foreground","-forbid-restarts"]

ARG VC_API_TOKEN

ENV VC_API_TOKEN="${VC_API_TOKEN}"
