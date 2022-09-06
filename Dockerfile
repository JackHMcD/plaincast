FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl \
    gcc \
    g++ \
    git
    
RUN go install github.com/tiuub/plaincast@latest

ENTRYPOINT [ "/go/bin/plaincast" ]

