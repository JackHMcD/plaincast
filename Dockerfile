FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl \
    gcc \
    g++ \
    git
    
RUN mkdir golang
RUN cd golang
RUN export GOPATH="`pwd`"
RUN mkdir -p src/github.com/tiuub/plaincast
RUN cd src/github.com/tiuub
RUN git clone https://github.com/tiuub/plaincast.git
RUN cd
RUN cd golang

RUN go get github.com/tiuub/plaincast
RUN go install github.com/tiuub/plaincast

WORKDIR golang

ENTRYPOINT [ "bin/plaincast" ]

