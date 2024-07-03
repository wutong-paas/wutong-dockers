FROM swr.cn-southwest-2.myhuaweicloud.com/wutong/wt-api-telepresence-interceptor-base

ARG TARGETARCH

WORKDIR /telepresence

COPY connect-and-intercept.sh connect-and-intercept.sh
COPY health-check.sh health-check.sh
COPY leave-and-quit.sh leave-and-quit.sh

ENTRYPOINT [ "./connect-and-intercept.sh" ]