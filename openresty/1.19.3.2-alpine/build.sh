#! /bin/bash

export NAMESPACE=openresty
export VERSION=1.19.3.2-alpine
docker buildx use swrbuilder || docker buildx use swrbuilder || docker buildx create --use --name swrbuilder --driver docker-container --driver-opt image=swr.cn-southwest-2.myhuaweicloud.com/wutong/buildkit:stable

docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm swrbuilder