FROM quay.io/coreos/etcd:v3.3.18-arm64

RUN { \
echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch main contrib non-free"; \
echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-updates main contrib non-free"; \
echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-backports main contrib non-free"; \
echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian-security stretch/updates main contrib non-free"; \
} > /etc/apt/sources.list \
    && apt-get update