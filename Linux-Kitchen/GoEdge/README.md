# GoEdge CDN

## 项目简介
GoEdge CDN 是一个高性能、易于使用的内容分发网络（CDN）解决方案，旨在提供快速、可靠的内容交付服务。

## 功能特性
- 高效的缓存机制
- 支持多种协议（HTTP/HTTPS）
- 灵活的配置选项
- 实时监控和统计
- 安全的访问控制

## 安装与配置

### 环境要求
- Go 1.16 或更高版本
- Linux 操作系统

### 手动安装步骤
1. 安装基础工具：
    ```
    apt install unzip -y
    ```

2. 屏蔽官方域名：
    ```
    echo "127.0.0.1 goedge.cloud" | sudo tee -a /etc/hosts > /dev/null
    echo "127.0.0.1 goedge.cn" | sudo tee -a /etc/hosts > /dev/null
    echo "127.0.0.1 dl.goedge.cloud" | sudo tee -a /etc/hosts > /dev/null
    echo "127.0.0.1 dl.goedge.cn" | sudo tee -a /etc/hosts > /dev/null
    echo "127.0.0.1 global.dl.goedge.cloud" | sudo tee -a /etc/hosts > /dev/null
    echo "127.0.0.1 global.dl.goedge.cn" | sudo tee -a /etc/hosts > /dev/null
    cat /etc/hosts
    ```

3. 创建安装目录：
    ```
    mkdir  /usr/local/goedge
    cd /usr/local/goedge
    ```
4. 获取程序并解压：

    X86_64
    ```
    wget https://github.com/DearTanker/Kitchen/releases/download/GoEdge/edge-admin-linux-amd64-plus-v1.3.9.zip
    unzip -o ./edge-admin-linux-amd64-plus-v1.3.9.zip
    ```
    ARM
    ```
    wget https://github.com/DearTanker/Kitchen/releases/download/GoEdge/edge-admin-linux-arm64-plus-v1.3.9.zip
    unzip -o ./edge-admin-linux-arm64-plus-v1.3.9.zip
    ```
5. 启动管理平台

    ```
    cd edge-admin/
    bin/edge-admin start
    ```
6. 安装系统服务
    ```
    bin/edge-admin service
    ```
7. 替换边缘节点程序

    ```
    cd /usr/local/goedge/edge-admin/edge-api/deploy
    rm -rf *.zip
    ```
    X86_64
    ```
    wget -O edge-node-linux-amd64-v1.3.9.zip https://github.com/DearTanker/Kitchen/releases/download/GoEdge/edge-node-linux-amd64-plus-v1.3.9.zip
    ```
    ARM
    ```
    wget -O edge-node-linux-arm64-v1.3.9.zip https://github.com/DearTanker/Kitchen/releases/download/GoEdge/edge-node-linux-arm64-plus-v1.3.9.zip
    ```
    
8. 激活开心版

    注册码：
    ```
    F4BuVYEKSDWV+I13ISd5NUyBcWOlH0af4/ow9obzYBS3XvYC9IsK86k5UDyyBv9vqJWN2/FQTDbPyuAO0zxYlkLDC0c8rrShs+7PAkqM0O8wBIGknzForgidDZahky5Lo/ZWaPZ1dVFUxmV29ykb0I0b4tv7Q3OtnTylOuzf//MYrlvyw6VJQMGnsttmeHzsNL/r0yDONOEXZoGoLZsuBKnkfXt+qt6bZF+kM1ncbh+sY42BrPTWQ12sXqJS3qHlzU0FFl9lTNzLGYYhq5vi/4sJuPVE50/uLCtslTJdb9zOGR915hnM+jHYsR+jUk0QxOqtreaHpsvNuLkexXbkmA==
    ```
    ```
    F4BuVYEKSDWV+I13ISd5NUyBcWOlH0af4/ow9obzYBS3XvYC9IsK86k5UDyyBv9vqJWN2/FQTDbPyuAO0zxYlkLDC0c8rrShs+7PAkqM0O8wBIGknzForgidDZahky5Lo/ZWaPZ1dVFUxmV29ykb0I0b4tv7Q3OtnTylOuzf//MYrlvyw6VJQMGnsttmeHzsNL/r0yDONOEXZoGoLZsuBKnkfXt+qt6bZF+kM1ncbh+sY42BrPTWQ12sXqJS3qHlzU0FFl9lTNzLGYYhq5vi/4sJuPVE50/uLCtslTJdb9zOGR915hnM+jHYsR+jUk0QxOqtreaHpsvNuLkexXbkmA==
    ```
