FROM golang:1.13-alpine as builder

# building app
WORKDIR /go/src/app
ADD . /go/src/app
RUN go mod download
RUN go build -o /go/bin/app main.go

FROM alpine
COPY --from=builder /go/bin/app /
ENTRYPOINT ["/app"]
