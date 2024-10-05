感谢原项目：https://github.com/AaronYES/aaPanel

### aaPanel 小工具 | 安装原版、降级 6.8.37、降级 6.8.23 等

```
wget https://raw.githubusercontent.com/DearTanker/Kitchen/main/aaPanel-Kitchen/aapanel-tools.sh  -O aapanel-tools.sh && chmod +x aapanel-tools.sh && clear && ./aapanel-tools.sh
```

### aaPanel 官方原版

```
URL=https://www.aapanel.com/script/install_7.0_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO "$URL" ;else wget --no-check-certificate -O install_7.0_en.sh "$URL";fi;bash install_7.0_en.sh aapanel
```

Update pip

```
/www/server/panel/pyenv/bin/python3 -m pip install --upgrade pip
```

Disable log upload

```
echo "" > /www/server/panel/script/site_task.py
chattr +i /www/server/panel/script/site_task.py
rm -rf /www/server/panel/logs/request/*
chattr +i -R /www/server/panel/logs/request
```
