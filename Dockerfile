FROM --platform=${BUILDPLATFORM} alpine
ARG TARGETOS
ARG TARGETARCH
RUN echo "Hello Cloud Agent ${TARGETOS}/${TARGETARCH}"
ADD https://github.com/timdesi/test-docker1/releases/latest/download/cloud_agent_azure-linux-arm64.tar.gz /tmp
RUN ls -l /tmp
