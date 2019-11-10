
FROM golang:alpine AS builder
RUN go version

COPY . /go/src/github.com/ominidx/timeissue/
WORKDIR /go/src/github.com/ominidx/timeissue/

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o app .

#   FROM alpine:3.7
#   RUN apk --no-cache add ca-certificates
#
FROM scratch
WORKDIR /root/
COPY --from=builder /go/src/github.com/ominidx/timeissue/app .

ENTRYPOINT ["./app"]
