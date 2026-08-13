# Build stage
FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o server .

# Runtime stage
FROM alpine:3.22

WORKDIR /app

ARG PORT=8085
ENV PORT=${PORT}

COPY --from=builder /app/server .

EXPOSE ${PORT}

CMD ["./server"]