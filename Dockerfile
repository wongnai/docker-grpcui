FROM golang:1.16.0-alpine3.13 AS builder

LABEL maintainer="Suparit Krityakien <suparit@wongnai.com>"

RUN apk update && apk add --no-cache git

RUN go get -x github.com/fullstorydev/grpcui && \
    go install -x github.com/fullstorydev/grpcui/cmd/grpcui@v1.1.0

COPY scripts/ /usr/local/scripts/
RUN chmod +x /usr/local/scripts/*.sh

EXPOSE 8080/tcp

FROM alpine:3.13.2

COPY --from=builder /usr/local/scripts /usr/local/scripts
COPY --from=builder /go/bin/grpcui /usr/bin/grpcui

RUN apk update && apk add --no-cache bash
RUN adduser -S -u 10001 user
USER user

CMD ["/usr/local/scripts/start.sh"]
