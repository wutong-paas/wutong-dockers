#! /bin/bash
# 使用 arm64 机器执行

export NAMESPACE=etcd
export VERSION=v3.3.18-arm64
docker build -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker build -t wutongpaas/${NAMESPACE}:${VERSION} -f Dockerfile .

docker push swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION}
# docker push wutongpaas/${NAMESPACE}:${VERSION}
