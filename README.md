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
| hub.rat.dev | ✅ Good | 47.09 MB/s | 0.875s | ✅ Verified |
| docker.1panel.live | ✅ Good | 60.25 MB/s | 0.684s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 51.19 MB/s | 0.805s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 90.17 MB/s | 0.457s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 58.53 MB/s | 0.704s | ✅ Verified |
| lynn520.xyz | ✅ Good | 89.98 MB/s | 0.458s | ✅ Verified |
| ginger20240704.asia | ✅ Good | 53.66 MB/s | 0.768s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 8.78 MB/s | 4.692s | ✅ Verified |
| docker.wget.at | ✅ Good | 64.09 MB/s | 0.643s | ✅ Verified |
| docker.awsl9527.cn | ✅ Good | 58.79 MB/s | 0.701s | ✅ Verified |
| dislabaiot.xy | ❌ Failed | - | - | - |
| dockerpull.com | ✅ Good | 56.22 MB/s | 0.733s | ✅ Verified |
| docker.fxxk.dedyn.io | ❌ Failed | - | - | - |
| dhub.kubesre.xyz | ✅ Good | 11.89 MB/s | 3.466s | ✅ Verified |
| docker.m.daocloud.io|  |  |  |  |
| dockerhub.icu|  |  |  |  |

> [!NOTE]
> 以下均为 Debian 系统配置，其余系统配置镜像源需要做调整。

## 安装 Docker

1. 添加 Docker 的 GPG 密钥
   ```shell
   curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```
2. 安装 Docker
  ```shell
  apt update
  apt install docker-ce docker-ce-cli containerd.io
  ```
3. 配置镜像
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
4. 重启 Docker 服务
   ```shell
   systemctl daemon-reload
   systemctl restart docker
   ```
