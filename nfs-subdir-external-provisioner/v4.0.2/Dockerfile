#! /bin/bash
# References:
# 1. https://docs.docker.com/buildx/working-with-buildx/
# 2. https://docs.docker.com/engine/reference/commandline/buildx/

# Requirements:
# 1. docker run --privileged --rm tonistiigi/binfmt --install all
# 2. docker login -u wutongpaas -p xxx

export REPO_NAME=nfs-subdir-external-provisioner
export VERSION=v4.0.2
docker buildx create --use --name mybuilder
docker buildx build --platform linux/amd64,linux/arm64 --push -t wutongpaas/${REPO_NAME}:${VERSION} -f Dockerfile . 
docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${REPO_NAME}:${VERSION} -f Dockerfile . 
docker buildx rm mybuilder