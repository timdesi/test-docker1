FROM --platform=${BUILDPLATFORM} alpine
RUN echo "Hello Cloud Agent ${BUILDPLATFORM}"
