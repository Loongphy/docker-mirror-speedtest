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
| hub.rat.dev | ✅ Good | 22.68 MB/s | 2.206s | ✅ Verified |
| docker.1panel.live | ✅ Good | 52.79 MB/s | 0.948s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 41.25 MB/s | 1.213s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 55.85 MB/s | 0.896s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 35.54 MB/s | 1.408s | ✅ Verified |
| lynn520.xyz | ❌ Failed | - | - | - |
| ginger20240704.asia | ❌ Failed | - | - | - |
| docker.anyhub.us.kg | ✅ Good | 19.19 MB/s | 2.607s | ✅ Verified |
| docker.wget.at | ❌ Failed | - | - | - |
| docker.awsl9527.cn | ✅ Good | 63.03 MB/s | 0.794s | ✅ Verified |
| dockerpull.com | ❌ Failed | - | - | - |
| dhub.kubesre.xyz | ✅ Good | 14.22 MB/s | 3.518s | ✅ Verified |
| docker.m.daocloud.io | ✅ Good | 16.61 MB/s | 3.013s | ✅ Verified |
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
             "docker.awsl9527.cn","doublezonline.cloud","docker.1panel.live"
     ]
}
```

 3.重启 Docker 服务
```shell
systemctl daemon-reload
systemctl restart docker
```
