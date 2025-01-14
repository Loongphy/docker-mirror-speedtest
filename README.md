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
| hub.rat.dev | ✅ Good | 87.42 MB/s | 0.513s | ✅ Verified |
| docker.1panel.live | ✅ Good | 170.52 MB/s | 0.263s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 138.41 MB/s | 0.324s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 161.90 MB/s | 0.277s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 118.95 MB/s | 0.377s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 71.29 MB/s | 0.629s | ✅ Verified |
| docker.imgdb.de | ✅ Good | 9.01 MB/s | 4.972s | ✅ Verified |
| docker.awsl9527.cn | ✅ Good | 91.15 MB/s | 0.492s | ✅ Verified |
| cjie.eu.org | ✅ Good | 105.77 MB/s | 0.424s | ✅ Verified |
| docker.m.daocloud.io | ✅ Good | 13.23 MB/s | 3.388s | ✅ Verified |

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
             "docker.1panel.live","doublezonline.cloud","docker.wanpeng.top"
     ]
}
```

 3.重启 Docker 服务
```shell
systemctl daemon-reload
systemctl restart docker
```
