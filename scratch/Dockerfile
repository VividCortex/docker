FROM scratch
ADD vividcortex.tar.xz /
MAINTAINER VividCortex <containers@vividcortex.com>
LABEL app=vividcortex

WORKDIR /
ENTRYPOINT ["/usr/local/bin/vividcortex/vc-agent-007","-foreground","-forbid-restarts"]

ARG VC_API_TOKEN

ENV VC_API_TOKEN="${VC_API_TOKEN}"
