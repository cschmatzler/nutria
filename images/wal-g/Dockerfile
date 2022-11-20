FROM golang:1.19.3-bullseye AS builder

ENV WALG_VERSION=v2.0.1
ENV BROTLI_VERSION=v1.0.9

RUN set -ex \
     && apt update \
     && apt install -y wget cmake git build-essential bash

RUN set -ex \
     && cd /tmp \
     && wget -qO - https://github.com/google/brotli/archive/${BROTLI_VERSION}.tar.gz | tar xz -f '-' \
     && cd brotli* \
     && mkdir out \
     && cd out \
     && ../configure-cmake --disable-debug \
     && make \
     && make install

RUN set -ex \
     && git clone https://github.com/wal-g/wal-g/ $GOPATH/src/wal-g \
     && cd $GOPATH/src/wal-g/ \
     && git checkout $WALG_VERSION \
     && make install \
     && make deps \
     && make pg_build \
     && make link_brotli \
     && install main/pg/wal-g /

FROM debian:bullseye

COPY --from=builder /wal-g /
