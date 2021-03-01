#!/bin/bash

: ${PROTOSET:=""}
if [[ -f /protoset/service.protoset ]]; then
    PROTOSET="-protoset /protoset/service.protoset"
fi

grpcui -bind 0.0.0.0 ${PROTOSET} -plaintext -port 8080 ${GRPCUI_SERVER:-}
