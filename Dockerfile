FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    mpv-dev \
    mpv-libs \
    youtube-dl
  
RUN pwd
RUN  mkdir golang
COPY . /go
RUN cd golang
RUN pwd
RUN export GOPATH="`pwd`"

RUN go install github.com/tiuub/plaincast@latest
RUN pwd
RUN ls

RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]

