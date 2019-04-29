FROM golang:1.12.4-stretch

MAINTAINER Suparit Krityakien <suparit@wongnai.com>

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN go get -x github.com/fullstorydev/grpcui
RUN go install -x github.com/fullstorydev/grpcui/cmd/grpcui

COPY scripts/ /usr/local/scripts/
RUN chmod +x /usr/local/scripts/*.sh

ENV PATH /usr/local/scripts/:$PATH

EXPOSE 8080

ENTRYPOINT ["/tini", "-s", "--"]
CMD ["start.sh"]
