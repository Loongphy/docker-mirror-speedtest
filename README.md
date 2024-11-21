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
| hub.rat.dev | ✅ Good | 158.37 MB/s | 0.316s | ✅ Verified |
| docker.1panel.live | ✅ Good | 127.34 MB/s | 0.393s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 94.78 MB/s | 0.528s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 172.57 MB/s | 0.290s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 114.26 MB/s | 0.438s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 9.21 MB/s | 5.434s | ✅ Verified |
| docker.wget.at | ❌ Failed | - | - | - |
| docker.awsl9527.cn | ✅ Good | 102.34 MB/s | 0.489s | ✅ Verified |
| dockerpull.org | ✅ Good | 34.42 MB/s | 1.454s | ✅ Verified |
| dhub.kubesre.xyz | ✅ Good | 15.62 MB/s | 3.203s | ✅ Verified |
| docker.m.daocloud.io | ✅ Good | 17.10 MB/s | 2.926s | ✅ Verified |

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
