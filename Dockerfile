FROM golang:1.12.4-alpine AS builder

LABEL maintainer="Suparit Krityakien <suparit@wongnai.com>"

RUN apk update && apk add --no-cache git

RUN go get -x github.com/fullstorydev/grpcui && \
    go install -x github.com/fullstorydev/grpcui/cmd/grpcui

COPY scripts/ /usr/local/scripts/
RUN chmod +x /usr/local/scripts/*.sh

EXPOSE 8080

FROM alpine:3.10.2 
COPY --from=builder /usr/local/scripts /usr/local/scripts
COPY --from=builder /go/bin/grpcui /usr/bin/grpcui
RUN apk update && apk add --no-cache bash
RUN adduser -S -u 10001 user
USER user
CMD ["/usr/local/scripts/start.sh"]
