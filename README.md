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
| hub.rat.dev | ✅ Good | 79.16 MB/s | 0.566s | ✅ Verified |
| docker.1panel.live | ✅ Good | 100.68 MB/s | 0.445s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 82.51 MB/s | 0.543s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 136.18 MB/s | 0.329s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 94.92 MB/s | 0.472s | ✅ Verified |
| lynn520.xyz | ✅ Good | 165.94 MB/s | 0.270s | ✅ Verified |
| ginger20240704.asia | ✅ Good | 120.76 MB/s | 0.371s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 38.19 MB/s | 1.173s | ✅ Verified |
| docker.wget.at | ✅ Good | 102.06 MB/s | 0.439s | ✅ Verified |
| docker.awsl9527.cn | ✅ Good | 71.11 MB/s | 0.630s | ✅ Verified |
| dockerpull.com | ✅ Good | 100.01 MB/s | 0.448s | ✅ Verified |
| dhub.kubesre.xyz | ✅ Good | 13.24 MB/s | 3.383s | ✅ Verified |
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
