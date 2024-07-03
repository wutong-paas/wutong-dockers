#!/bin/bash

# build binary
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/wt-api-agent-reverse-proxy-linux-amd64 main.go
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o bin/wt-api-agent-reverse-proxy-linux-arm64 main.go

export NAMESPACE=wt-api-agent-reverse-proxy
export VERSION=latest
docker buildx use swrbuilder || docker buildx create --use --name swrbuilder --driver docker-container --driver-opt image=swr.cn-southwest-2.myhuaweicloud.com/wutong/buildkit:stable

docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm swrbuilder
rm -rf bin