FROM --platform=${BUILDPLATFORM} golang:alpine AS build
WORKDIR /src
ENV CGO_ENABLED=0
COPY . .
ARG TARGETOS
ARG TARGETARCH

ARG LDFLAGS="-ldflags=-w -s"
ARG OTHERFLAGS="-trimpath -mod=readonly"
ARG VERSION="-X 'main.version=${CLOUD_AGENT_VERSION}'"
RUN echo ${VERSION}
ARG TAGS=things
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -tags ${TAGS} -o /out/cloudagent ${LDFLAGS} ${VERSION} ${OTHERFLAGS} .

FROM scratch AS bin
COPY --from=build /out/cloudagent /
CMD ["/cloudagent"]
