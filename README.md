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
| hub.rat.dev | ✅ Good | 68.09 MB/s | 0.735s | ✅ Verified |
| docker.1panel.live | ✅ Good | 68.65 MB/s | 0.729s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 61.33 MB/s | 0.816s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 95.14 MB/s | 0.526s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 60.29 MB/s | 0.830s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 27.14 MB/s | 1.844s | ✅ Verified |
| docker.wget.at | ❌ Failed | - | - | - |
| docker.awsl9527.cn | ✅ Good | 64.99 MB/s | 0.770s | ✅ Verified |
| dockerpull.org | ✅ Good | 51.17 MB/s | 0.978s | ✅ Verified |
| dhub.kubesre.xyz | ✅ Good | 14.32 MB/s | 3.494s | ✅ Verified |
| docker.m.daocloud.io | ✅ Good | 15.72 MB/s | 3.182s | ✅ Verified |

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
