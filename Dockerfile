FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl \
    gcc \
    g++ \
    python3
    
RUN ln -sf python3 /usr/bin/python
RUN go install github.com/tiuub/plaincast@latest

ENTRYPOINT [ "/bin/sh" ]


