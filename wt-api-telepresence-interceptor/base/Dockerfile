FROM swr.cn-southwest-2.myhuaweicloud.com/wutong/alpine:3.15

ARG TARGETARCH

RUN curl -fL https://wutong-paas.obs.cn-east-3.myhuaweicloud.com/files/telepresence-linux-${TARGETARCH} -o /usr/local/bin/telepresence && \
    curl -fL https://wutong-paas.obs.cn-east-3.myhuaweicloud.com/files/kubectl-linux-${TARGETARCH} -o /usr/local/bin/kubectl && \
    chmod a+x /usr/local/bin/kubectl && \
    chmod a+x /usr/local/bin/telepresence

