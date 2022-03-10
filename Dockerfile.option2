FROM --platform=${BUILDPLATFORM} alpine
ARG TARGETOS
ARG TARGETARCH
RUN echo "Hello Cloud Agent ${TARGETOS}/${TARGETARCH}"
ADD https://github.com/timdesi/test-docker1/releases/latest/download/cloud_agent_azure-linux-arm64.tar.gz /edge/cloudagent.tar.gz
WORKDIR /edge
RUN ls -l
RUN tar -xf cloudagent.tar.gz
RUN rm cloudagent.tar.gz
RUN ls -l


