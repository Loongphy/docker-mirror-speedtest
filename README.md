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
| hub.rat.dev | ✅ Good | 62.40 MB/s | 0.802s | ✅ Verified |
| docker.1panel.live | ✅ Good | 70.19 MB/s | 0.713s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 60.95 MB/s | 0.821s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 88.57 MB/s | 0.565s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 59.29 MB/s | 0.844s | ✅ Verified |
| lynn520.xyz | ❌ Failed | - | - | - |
| ginger20240704.asia | ❌ Failed | - | - | - |
| docker.anyhub.us.kg | ✅ Good | 7.59 MB/s | 6.588s | ✅ Verified |
| docker.wget.at | ❌ Failed | - | - | - |
| docker.awsl9527.cn | ✅ Good | 60.15 MB/s | 0.832s | ✅ Verified |
| dockerpull.com | ❌ Failed | - | - | - |
| dhub.kubesre.xyz | ✅ Good | 14.71 MB/s | 3.401s | ✅ Verified |
| docker.m.daocloud.io | ✅ Good | 15.33 MB/s | 3.263s | ✅ Verified |
| dockerhub.icu | ❌ Failed | - | - | - |

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
             "doublezonline.cloud","docker.1panel.live","hub.rat.dev"
     ]
}
```

 3.重启 Docker 服务
```shell
systemctl daemon-reload
systemctl restart docker
```
