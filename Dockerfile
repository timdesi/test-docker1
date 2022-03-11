FROM --platform=${BUILDPLATFORM} golang:alpine AS build
WORKDIR /src
ENV CGO_ENABLED=0
COPY . .
ARG TARGETOS
ARG TARGETARCH

ENV LDFLAGS="-ldflags=-w -s"
ENV OTHERFLAGS="-trimpath -mod=readonly"
ENV CLOUD_AGENT_VERSION="-X 'main.version=${CLOUD_AGENT_VERSION}'"
ENV TAGS=things
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -tags ${TAGS} -o /out/cloudagent "${LDFLAGS} ${CLOUD_AGENT_VERSION}" ${OTHERFLAGS} .

FROM scratch AS bin
COPY --from=build /out/cloudagent /
CMD ["/cloudagent"]
