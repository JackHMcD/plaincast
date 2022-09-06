FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl \
    gcc \
    g++
  
RUN pwd
RUN ls

WORKDIR /go

RUN go install github.com/tiuub/plaincast@latest

WORKDIR /go/src/github.com/tiuub/plaincast

RUN pwd
RUN ls

ENTRYPOINT [ "plaincast" ]

