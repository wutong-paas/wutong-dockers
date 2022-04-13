#! /bin/bash
# References:
# 1. https://docs.docker.com/buildx/working-with-buildx/
# 2. https://docs.docker.com/engine/reference/commandline/buildx/

# Requirements:
# 1. docker run --privileged --rm tonistiigi/binfmt --install all
# 2. docker login dockerhub
# 3. docker login myhuaweicloud-swr

export NAMESPACE=base-python-fastapi
export VERSION=3.8
# docker buildx create --use --name fastapibuilder
docker buildx use fastapibuilder
docker buildx build --platform linux/arm64,linux/amd64 --push -t wutongpaas/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile . 
# docker buildx rm fastapibuilder