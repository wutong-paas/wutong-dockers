#! /bin/bash

export NAMESPACE=etcd
export VERSION=v3.3.18-arm64
docker buildx use swrbuilder || docker buildx create --use --name swrbuilder
docker buildx build --platform linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm swrbuilder