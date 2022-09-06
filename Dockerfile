FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl \
    gcc \
    g++
    
RUN mkdir golang
RUN cd golang
RUN export GOPATH="`pwd`"

RUN go get -u github.com/tiuub/plaincast

WORKDIR golang

ENTRYPOINT [ "bin/plaincast" ]

