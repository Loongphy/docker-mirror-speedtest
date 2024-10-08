# Docker 镜像测速

## Why

因为众所周知的原因，国内访问 Docker Hub 的速度非常慢。广大热心网友贡献了大量的镜像加速服务，但是速度参差不齐。


所以该项目旨在罗列互联网上分享的镜像地址，并生成测速结果。

> [!WARNING]
> 测速利用 GitHub Actions，服务器托管在国外，因此测速结果中的速度快不代表国内拉取快。
>

本项目尽量保证罗列的镜像地址可用。

## 测速结果

| Registry | Status | Speed | Time | Integrity |
|----------|--------|-------|------|-----------|
| hub.rat.dev | ✅ Good | 78.46 MB/s | 0.571s | ✅ Verified |
| docker.1panel.live | ✅ Good | 96.77 MB/s | 0.463s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 79.86 MB/s | 0.561s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 132.16 MB/s | 0.339s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 74.05 MB/s | 0.605s | ✅ Verified |
| lynn520.xyz | ✅ Good | 163.52 MB/s | 0.274s | ✅ Verified |
| ginger20240704.asia | ✅ Good | 112.01 MB/s | 0.400s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 31.31 MB/s | 1.431s | ✅ Verified |
| docker.wget.at | ✅ Good | 99.56 MB/s | 0.450s | ✅ Verified |
| docker.awsl9527.cn | ✅ Good | 111.73 MB/s | 0.401s | ✅ Verified |
| dockerpull.com | ✅ Good | 73.57 MB/s | 0.609s | ✅ Verified |
| dhub.kubesre.xyz | ✅ Good | 8.23 MB/s | 5.442s | ✅ Verified |
| docker.m.daocloud.io|  |  |  |  |
| dockerhub.icu|  |  |  |  |

## Docker 配置

1. 安装 Docker
```shell
export DOWNLOAD_URL="https://mirrors.tuna.tsinghua.edu.cn/docker-ce"
# 如您使用 curl
curl -fsSL https://raw.githubusercontent.com/docker/docker-install/master/install.sh | sh
# 如您使用 wget
wget -O- https://raw.githubusercontent.com/docker/docker-install/master/install.sh | sh
```

2. 配置镜像

```shell
mkdir -p /etc/docker
nano /etc/docker/daemon.json
```

```json
{
     "registry-mirrors": [
             "https://doublezonline.cloud",
             "https://lynn520.xyz",
             "https://dockerpull.com",
             "https://docker.1panel.live"
     ]
}
```

 3.重启 Docker 服务
```shell
systemctl daemon-reload
systemctl restart docker
```
