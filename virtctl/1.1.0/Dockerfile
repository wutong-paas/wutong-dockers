# 使用基础镜像（Alpine Linux是一个轻量级的Linux发行版）
FROM alpine:latest

# 更新包管理器索引并安装OpenSSH客户端
RUN apk update && apk add --no-cache openssh-client && rm -rf /var/cache/apk/* && \
    if [ $(uname -m) = "aarch64" ]; then \
    wget https://github.com/kubevirt/kubevirt/releases/download/v1.1.0/virtctl-v1.1.0-linux-arm64 -O /usr/local/bin/virtctl; \
    else \
    wget https://github.com/kubevirt/kubevirt/releases/download/v1.1.0/virtctl-v1.1.0-linux-amd64 -O /usr/local/bin/virtctl; \
    fi && chmod +x /usr/local/bin/virtctl

WORKDIR /channel

# 在这里可以添加任何其他自定义命令或配置，例如拷贝SSH密钥

# 启动一个无限循环以保持容器运行
CMD ["tail", "-f", "/dev/null"]
