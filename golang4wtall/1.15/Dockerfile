FROM --platform=${TARGETPLATFORM} golang:1.15 as builder
ARG TARGETOS TARGETARCH TARGETPLATFORM

COPY ./libzmq /opt/libzmq

ENV PKG_CONFIG_PATH /opt/libzmq/lib/pkgconfig/

RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        rm /opt/libzmq -r; \
        apt update && apt-get install -y libzmq3-dev; \
        apt-get update && apt-get install -y gcc-aarch64-linux-gnu; \
    else \
        apt-get update && apt-get install -y pkg-config musl-dev; \
        cp /opt/libzmq/include/* /usr/include/ && cp -r /opt/libzmq/share/* /usr/share/ && cp -r /opt/libzmq/lib/* /usr/lib/; \
    fi