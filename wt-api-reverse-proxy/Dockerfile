FROM swr.cn-southwest-2.myhuaweicloud.com/wutong/alpine:3.15

ARG TARGETARCH

WORKDIR /

COPY bin/wt-api-agent-reverse-proxy-linux-${TARGETARCH} ./wt-api-agent-reverse-proxy

ENTRYPOINT [ "./wt-api-agent-reverse-proxy" ]