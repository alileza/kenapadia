FROM golang:latest AS builder

COPY . /build

RUN go build -o /build/kenapadia /build/main.go

# ---

FROM alpine

COPY --from=builder /build/kenapadia /bin/kenapadia

ENTRYPOINT [ "/bin/kenapadia" ]
EXPOSE 8000
