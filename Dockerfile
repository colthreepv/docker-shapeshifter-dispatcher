ARG VERSION=master
FROM golang:alpine AS build
ARG VERSION

RUN apk add -qU git
RUN cd /go/src \
  && mkdir -p github.com/OperatorFoundation \
  && cd github.com/OperatorFoundation \
  && git clone --branch $VERSION https://github.com/OperatorFoundation/shapeshifter-dispatcher.git --depth 1 \
  && cd /go/src/github.com/OperatorFoundation/shapeshifter-dispatcher/shapeshifter-dispatcher \
  && go get -v \
  && go build

FROM alpine:3
COPY --from=build /go/src/github.com/OperatorFoundation/shapeshifter-dispatcher/shapeshifter-dispatcher/shapeshifter-dispatcher /bin/shapeshifter-dispatcher
ENTRYPOINT shapeshifter-dispatcher
