#! /bin/bash
# References:
# 1. https://docs.docker.com/buildx/working-with-buildx/
# 2. https://docs.docker.com/engine/reference/commandline/buildx/

# Requirements:
# 1. docker run --privileged --rm tonistiigi/binfmt --install all
# 2. docker login -u wutongpaas -p xxx

export NAMESPACE=openresty
export VERSION=1.19.3.2-alpine
docker buildx create --use --name openrestybuilder
docker buildx build --platform linux/amd64,linux/arm64 --push -t wutongpaas/${NAMESPACE}:${VERSION} -f Dockerfile . 
docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
docker buildx rm openrestybuilder