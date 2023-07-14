# FROM golang:1.17-alpine

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk --no-cache add pkgconfig gcc musl-dev

# COPY ./libzmq /opt/libzmq

# ENV PKG_CONFIG_PATH /opt/libzmq/lib/pkgconfig/

# RUN cp /opt/libzmq/include/* /usr/include/ && cp -r /opt/libzmq/share/* /usr/share/ \
#     && cp -r /opt/libzmq/lib/* /usr/lib/

# WORKDIR /go

FROM golang:1.17-alpine

COPY ./libzmq /opt/libzmq

RUN if [ $(uname -m) = "aarch64" ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk --no-cache add zeromq-dev gcc libc-dev; \
    else \
    mkdir -p /usr/include && cp /opt/libzmq/include/* /usr/include/ && cp -r /opt/libzmq/share/* /usr/share/ && \
    cp -r /opt/libzmq/lib/* /usr/lib/ && \
    env PKG_CONFIG_PATH=/opt/libzmq/lib/pkgconfig/ \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk --no-cache add pkgconfig gcc musl-dev; \
    fi && \
    rm -rf /opt/libzmq

WORKDIR /go
    


