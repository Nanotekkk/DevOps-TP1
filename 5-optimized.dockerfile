FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go-app/go.mod go-app/go.sum ./
RUN go mod download

COPY go-app/ .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o server .

FROM alpine:3.20

RUN adduser -D -u 1000 appuser

WORKDIR /app

COPY --from=builder /app/server .

RUN chown appuser:appuser /app/server

USER appuser

EXPOSE 8080

CMD ["./server"]