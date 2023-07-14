#! /bin/bash

export NAMESPACE=alpine
export VERSION=3.15
docker buildx use mybuilder || docker buildx create --use --name mybuilder
docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm mybuilder