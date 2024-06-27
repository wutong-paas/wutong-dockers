FROM swr.cn-southwest-2.myhuaweicloud.com/wutong/alpine:3.15

ARG TARGETARCH

WORKDIR /telepresence

COPY connect-and-intercept.sh connect-and-intercept.sh
COPY leave-and-quit.sh leave-and-quit.sh

RUN curl -fL https://wutong-paas.obs.cn-east-3.myhuaweicloud.com/files/telepresence-linux-${TARGETARCH} -o /usr/local/bin/telepresence && \
    chmod a+x /usr/local/bin/telepresence

ENTRYPOINT [ "./connect-and-intercept.sh" ]