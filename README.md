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
| hub.rat.dev | ✅ Good | 119.16 MB/s | 0.376s | ✅ Verified |
| docker.1panel.live | ✅ Good | 103.00 MB/s | 0.435s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 95.12 MB/s | 0.471s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 182.87 MB/s | 0.245s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 112.57 MB/s | 0.398s | ✅ Verified |
| lynn520.xyz | ❌ Failed | - | - | - |
| ginger20240704.asia | ✅ Good | 103.71 MB/s | 0.432s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 37.74 MB/s | 1.187s | ✅ Verified |
| docker.wget.at | ❌ Failed | - | - | - |
| docker.awsl9527.cn | ✅ Good | 89.07 MB/s | 0.503s | ✅ Verified |
| dockerpull.com | ❌ Failed | - | - | - |
| dhub.kubesre.xyz | ✅ Good | 14.36 MB/s | 3.120s | ✅ Verified |
| docker.m.daocloud.io | ✅ Good | 17.67 MB/s | 2.535s | ✅ Verified |
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
             "doublezonline.cloud","hub.rat.dev","docker.mrxn.net"
     ]
}
```

 3.重启 Docker 服务
```shell
systemctl daemon-reload
systemctl restart docker
```
