FROM golang:buster AS builder

WORKDIR /go/src/app
COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o /app main.go

FROM scratch
COPY --from=builder /app /app
ENTRYPOINT ["/app"]