FROM swr.cn-southwest-2.myhuaweicloud.com/wutong/alpine:edge

RUN apk --no-cache add restic && apk --no-cache add kopia --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ && \
    rm -rf /var/cache/apk/*
