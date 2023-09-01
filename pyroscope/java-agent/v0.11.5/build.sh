#! /bin/bash

export NAMESPACE=pyroscope-java-agent
export VERSION=v0.11.5
docker buildx use swrbuilder || docker buildx create --use --name swrbuilder
docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm swrbuilder