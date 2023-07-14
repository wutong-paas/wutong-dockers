#! /bin/bash

export NAMESPACE=etcd
export VERSION=v3.3.18-arm64
docker buildx use mybuilder || docker buildx create --use --name mybuilder
docker buildx build --platform linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm mybuilder