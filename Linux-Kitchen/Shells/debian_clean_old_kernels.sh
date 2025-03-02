#!/bin/bash

# 获取当前正在使用的内核版本
current_kernel=$(uname -r)

# 打印当前内核版本
echo "当前使用的内核版本是: $current_kernel"

# 获取已安装的内核列表，排除当前使用的内核版本和 linux-image-amd64
kernels_to_remove=$(dpkg --list | grep 'linux-image' | awk '{print $2}' | grep -v "$current_kernel" | grep -v "linux-image-amd64")
kernels_to_keep="linux-image-amd64 $current_kernel"

# 获取要删除的内核版本列表
if [ -z "$kernels_to_remove" ]; then
  echo "没有找到需要删除的内核，所有内核都已保留。"
  exit 0
fi

# 打印保留的内核，每个内核一行
echo "保留以下内核："
for kernel in $kernels_to_keep; do
  echo "$kernel"
done

# 打印将要删除的内核
echo "将要删除以下内核版本："
echo "$kernels_to_remove"

# 提示用户确认
echo "确认删除上述内核吗? 请输入 y 进行确认，其他键取消："
read -r user_input

# 判断用户输入
if [[ "$user_input" != "y" && "$user_input" != "Y" ]]; then
  echo "取消删除操作。"
  exit 0
fi

# 删除这些内核
for kernel in $kernels_to_remove; do
  echo "正在删除内核：$kernel"
  sudo apt-get purge -y $kernel
done

# 清理不再使用的依赖
sudo apt-get autoremove -y

# 更新 GRUB 配置
sudo update-grub

# 完成提示
echo "内核删除完成，GRUB 已更新。"
