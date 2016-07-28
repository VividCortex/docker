FROM phusion/baseimage:0.9.17
MAINTAINER VividCortex <containers@vividcortex.com>
WORKDIR /
LABEL app vividcortex

ENV VC_HOME=/vc

RUN mkdir -p $VC_HOME; cd $VC_HOME; mkdir -p bin lock logs; touch pid; 

RUN curl -o $VC_HOME/bin/vc-agent-007 https://download.vividcortex.com/linux-static/x86_64/current/vc-agent-007 && chmod 755 $VC_HOME/bin/vc-agent-007

ADD vc_agent /vc_agent

ADD Procfile /Procfile

RUN chmod +x /vc_agent
