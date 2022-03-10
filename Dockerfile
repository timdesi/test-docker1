FROM --platform=${BUILDPLATFORM} alpine
ARG TARGETOS
ARG TARGETARCH
RUN echo "Hello Cloud Agent ${TARGETOS}/${TARGETARCH}"
ADD https://github.com/timdesi/test-docker1/releases/latest/download/cloud_agent_azure-linux-arm64.tar.gz /edge/cloudagent.tar.gz
RUN ls -l /edge
RUN tar -xf /edge/cloudagent.tar.gz -C /edge
RUN ls -l /edge


