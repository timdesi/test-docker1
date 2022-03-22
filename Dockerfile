FROM --platform=${BUILDPLATFORM} golang:alpine AS build
WORKDIR /src
ENV CGO_ENABLED=0
COPY . .
ARG TARGETOS
ARG TARGETARCH
# Set default version, this would be overwrite from GitHub Action
ARG CLOUD_AGENT_VERSION=v0.0

# Build flags
ARG LDFLAGS="-ldflags=-w -s"
ARG OTHERFLAGS="-trimpath -mod=readonly"
ARG VERSION="-X 'main.version=${CLOUD_AGENT_VERSION}'"
RUN echo ${VERSION}

# Default tags
ARG TAGS=things

# Build
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -tags ${TAGS} -o /out/cloudagent "${LDFLAGS} ${VERSION}" ${OTHERFLAGS} .

# Final container
FROM busybox AS bin

ARG TARGETOS=default
ARG TARGETARCH=default

RUN echo TARGETOS2 ${TARGETOS}
RUN echo TARGETARCH2 ${TARGETARCH}

COPY --from=build /src/cloudagent /app/
#COPY --from=build /src/iothub.crt /
COPY --from=build /src/resources/cloudagent_start.sh /app/
COPY --from=build /src/resources/. /config
RUN ls -l
RUN ls -l /config
RUN rm /config/cloudagent_*
RUN ls -l /config

WORKDIR /app
RUN ls -l
CMD ["./cloudagent_start.sh"]
