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

RUN pwd
RUN ls

WORKDIR /go/bin

RUN pwd
RUN ls

ENTRYPOINT [ "plaincast" ]

