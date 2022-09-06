FROM golang

RUN \
  apt update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
      libmpv-dev \
      python3-pip \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  pip install --no-cache youtube-dl \
  && youtube-dl --version
  
RUN  mkdir golang
RUN cd golang
RUN export GOPATH="`pwd`"

RUN go install github.com/tiuub/plaincast@latest


RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]

