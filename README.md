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
| hub.rat.dev | ✅ Good | 54.15 MB/s | 0.761s | ✅ Verified |
| docker.1panel.live | ✅ Good | 127.98 MB/s | 0.322s | ✅ Verified |
| docker.wanpeng.top | ✅ Good | 70.44 MB/s | 0.585s | ✅ Verified |
| doublezonline.cloud | ✅ Good | 114.16 MB/s | 0.361s | ✅ Verified |
| docker.mrxn.net | ✅ Good | 96.28 MB/s | 0.428s | ✅ Verified |
| lynn520.xyz | ✅ Good | 138.76 MB/s | 0.297s | ✅ Verified |
| ginger20240704.asia | ✅ Good | 68.91 MB/s | 0.598s | ✅ Verified |
| docker.anyhub.us.kg | ✅ Good | 57.08 MB/s | 0.722s | ✅ Verified |
| docker.wget.at | ✅ Good | 108.16 MB/s | 0.381s | ✅ Verified |
| docker.awsl9527.cn | ✅ Good | 109.60 MB/s | 0.376s | ✅ Verified |
| dislabaiot.xy | ❌ Failed | - | - | - |
| dockerpull.com | ✅ Good | 107.60 MB/s | 0.383s | ✅ Verified |
| docker.fxxk.dedyn.io | ❌ Failed | - | - | - |
| dhub.kubesre.xyz | ✅ Good | 10.85 MB/s | 3.796s | ✅ Verified |
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
