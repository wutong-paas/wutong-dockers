docker buildx create --use --name node-shell-builder
docker buildx use node-shell-builder
docker buildx build --platform linux/amd64,linux/arm64 --push -t swr.cn-southwest-2.myhuaweicloud.com/wutong/node-shell -f Dockerfile .