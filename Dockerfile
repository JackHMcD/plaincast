FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl \
    gcc \
    g++
  
RUN pwd
RUN  mkdir golang
COPY . /go/src/github.com/tiuub/plaincast
RUN cd golang
RUN export GOPATH="`pwd`"

RUN go install github.com/tiuub/plaincast@latest

WORKDIR ${GOPATH}/src/github.com/tiuub/plaincast


RUN pwd
RUN ls

RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]

