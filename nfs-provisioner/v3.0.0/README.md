## 1. git clone nfs-provisioner
```bash
git clone https://github.com/kubernetes-sigs/nfs-ganesha-server-and-external-provisioner.git
cd nfs-ganesha-server-and-external-provisioner
```

## 2. add dockerfile
```bash
vim Dockerfile.me
```

```dockerfile
FROM --platform=${BUILDPLATFORM} golang:1.13 AS builder
WORKDIR /workspace
# Copy the Go Modules manifests
COPY . .
ENV GOPROXY=https://goproxy.cn
# cache deps before building and copying source so that we don't need to re-download as much
# and so that source changes don't invalidate our downloaded layer
RUN go mod download

# Build
ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -a -o /nfs-provisioner ./cmd/nfs-provisioner

FROM ghcr.io/kubernetes-sigs/nfs-ganesha:V3.5

WORKDIR /
COPY --from=builder /nfs-provisioner .

# expose mountd 20048/tcp and nfsd 2049/tcp and rpcbind 111/tcp 111/udp
EXPOSE 2049/tcp 20048/tcp 111/tcp 111/udp

ENTRYPOINT ["/nfs-provisioner"]
```

## 3. add build.sh
```bash
#! /bin/bash
# References:
# 1. https://docs.docker.com/buildx/working-with-buildx/
# 2. https://docs.docker.com/engine/reference/commandline/buildx/

# Requirements:
# 1. docker run --privileged --rm tonistiigi/binfmt --install all
# 2. docker login dockerhub
# 3. docker login myhuaweicloud-swr

export NAMESPACE=nfs-provisioner
export VERSION=v1.0.0-stable
docker buildx create --use --name ${NAMESPACE}-builder
docker buildx build --platform linux/amd64,linux/arm64 --push -t wutongpaas/${NAMESPACE}:${VERSION} -f Dockerfile.me . 
docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/${NAMESPACE}:${VERSION} -f Dockerfile.me . 
docker buildx rm ${NAMESPACE}-builder
```

## 4. exec
```bash
chmod +x ./build.sh
./build.sh
```