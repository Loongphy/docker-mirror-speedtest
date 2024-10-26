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
| hub.rat.dev | ✅ Good | 31.57 MB/s | 1.419s | ✅ Verified |
| docker.1panel.live | ✅ Good | 41.40 MB/s | 1.082s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 41.18 MB/s | 1.088s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 57.29 MB/s | 0.782s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 35.70 MB/s | 1.255s | ✅ Verified |
| lynn520.xyz | ❌ Failed | - | - | - |
| ginger20240704.asia | ✅ Good | 23.50 MB/s | 1.906s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 23.61 MB/s | 1.897s | ✅ Verified |
| docker.wget.at | ❌ Failed | - | - | - |
| docker.awsl9527.cn | ✅ Good | 49.39 MB/s | 0.907s | ✅ Verified |
| dockerpull.com | ✅ Good | 54.50 MB/s | 0.822s | ✅ Verified |
| dhub.kubesre.xyz | ✅ Good | 13.15 MB/s | 3.407s | ✅ Verified |
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
