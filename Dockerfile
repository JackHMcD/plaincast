FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
      mpv \
      yt-dlp

WORKDIR ${GOPATH}/src/github.com/aykevl/plaincast/
COPY . ${GOPATH}/src/github.com/aykevl/plaincast/

RUN go get -v .
RUN go install -i .

ENTRYPOINT [ "plaincast" ]
