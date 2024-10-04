#! /bin/bash

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[35m\033[01m$1\033[0m"
}

# 安装 aapanel 面板
function aapanel-install(){
	wget -O "/root/aapanel-install.sh" "https://raw.githubusercontent.com/DearTanker/Kitchen/refs/heads/main/aaPanel-Kitchen/aapanel-install.sh"
	red "正在从官网安装原版 aapanel 面板."
	bash "/root/aapanel-install.sh"
}

# 降级至 aapanel 6.8.37 (最后一个 6 系)
function downgrade-aapanel-6.8.37(){
	wget -O "/root/LinuxPanel_EN-6.8.37.zip" "https://raw.githubusercontent.com/DearTanker/Kitchen/refs/heads/main/aaPanel-Kitchen/aaPanel-6/LinuxPanel_EN-6.8.37.zip"
	red "下载完成,正在降级."
	unzip LinuxPanel_EN-6.8.23.zip
	cd /root/panel
	wget -O "/root/panel/aapanel-downgrade.sh" "https://raw.githubusercontent.com/DearTanker/Kitchen/refs/heads/main/aaPanel-Kitchen/aapanel-downgrade.sh" 
	bash "/root/panel/aapanel-downgrade.sh"
	red "降级成功."
	rm /root/LinuxPanel_EN-6.8.23.zip /root/panel/ -rf
}

# 降级至 aapanel 6.8.23 (最后一个无广告版本)
function downgrade-aapanel-6.8.23(){
	wget -O "/root/LinuxPanel_EN-6.8.23.zip" "https://raw.githubusercontent.com/DearTanker/Kitchen/refs/heads/main/aaPanel-Kitchen/aaPanel-6/LinuxPanel_EN-6.8.23.zip"
	red "下载完成,正在降级."
	unzip LinuxPanel_EN-6.8.23.zip
	cd /root/panel
	wget -O "/root/panel/aapanel-downgrade.sh" "https://raw.githubusercontent.com/DearTanker/Kitchen/refs/heads/main/aaPanel-Kitchen/aapanel-downgrade.sh" 
	bash "/root/panel/aapanel-downgrade.sh"
	red "降级成功."
	rm /root/LinuxPanel_EN-6.8.23.zip /root/panel/ -rf
}

# 卸载面板
	function uninstall(){
	wget -O "/root/aapanel-uninstall.sh" "https://raw.githubusercontent.com/DearTanker/Kitchen/refs/heads/main/aaPanel-Kitchen/aapanel-uninstall.sh"
	bash "/root/aapanel-uninstall.sh"
	red "面板卸载成功."
}

# 删掉日志文件，并且锁定文件防止写入
	function log(){
	echo "" > /www/server/panel/script/site_task.py
	chattr +i /www/server/panel/script/site_task.py
	rm -rf /www/server/panel/logs/request/*
	chattr +i -R /www/server/panel/logs/request
	}

# 清理垃圾
	function clean-up-trash(){
	rm LinuxPanel_EN-6.8.23.zip LinuxPanel_EN-6.8.37.zip aapanel-install.sh aapanel-uninstall.sh aapanel-downgrade.sh panel/ -rf
	red "清理成功."
	red "如果想删除此脚本 请执行 rm aapanel-tools.sh -rf "
}

# 菜单
function start_menu(){
    clear
    purple " 感谢使用 aaPanel 小助手."
    yellow " ————————————————————————————————————————————————"
    green  " 1. CentOS/Debian/Ubuntu 安装 aaPanel"
    yellow " ————————————————————————————————————————————————"
    green  " 2. 降级 6.8.37 版本 aaPanel"
    green  " 3. 降级 6.8.23 版本 aaPanel"
    green  " 4. 删除日志文件，锁定文件写入权限"
    yellow " ————————————————————————————————————————————————"
    green  " 5. 卸载面板"
    green  " 6. 清理脚本产生垃圾文件"
    green  " 0. 退出脚本"

    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           aapanel-install
	    ;;
        2 )
           downgrade-aapanel-6.8.37
        ;;
        3 )
           downgrade-aapanel-6.8.32
        ;;
        4 )
           log
        ;;
        5 )
           uninstall
        ;;
        6 )
           clean-up-trash
        ;;
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
