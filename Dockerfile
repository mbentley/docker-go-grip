FROM golang:alpine AS build

ARG GO-GRIP_VERSION=latest

RUN mkdir /data &&\
  echo "# go-grip" > /data/README.md &&\
  echo >> /data/README.md &&\
  echo "It looks like you forgot to bind mount your directory to /data!" >> /data/README.md &&\
  echo &&\
  echo "For usage info; see [mbentley/go-grip](https://github.com/mbentley/docker-go-grip)" >> /data/README.md

RUN go install github.com/chrishrb/go-grip@"${GO_GRIP_VERSION}"

FROM scratch

COPY --from=build /data /data
COPY --from=build /go/bin/go-grip /

WORKDIR /data
ENTRYPOINT ["/go-grip"]
CMD ["-b=false"]
