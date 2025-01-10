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
| hub.rat.dev | ✅ Good | 78.26 MB/s | 0.573s | ✅ Verified |
| docker.1panel.live | ✅ Good | 62.20 MB/s | 0.721s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 52.57 MB/s | 0.853s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 83.66 MB/s | 0.536s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 51.13 MB/s | 0.877s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 45.07 MB/s | 0.995s | ✅ Verified |
| docker.imgdb.de | ✅ Good | 8.77 MB/s | 5.111s | ✅ Verified |
| docker.awsl9527.cn | ✅ Good | 55.29 MB/s | 0.811s | ✅ Verified |
| dockerpull.org | ❌ Failed | - | - | - |
| docker.m.daocloud.io | ✅ Good | 13.66 MB/s | 3.281s | ✅ Verified |

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
             "doublezonline.cloud","hub.rat.dev","docker.1panel.live"
     ]
}
```

 3.重启 Docker 服务
```shell
systemctl daemon-reload
systemctl restart docker
```
