### aaPanel 官方原版
```
URL=https://www.aapanel.com/script/install_7.0_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO "$URL" ;else wget --no-check-certificate -O install_7.0_en.sh "$URL";fi;bash install_7.0_en.sh aapanel
```

### aaPanel 小工具 | 安装原版、降级 6.8.23 等
https://github.com/AaronYES/aaPanel
```
wget https://raw.githubusercontent.com/DearTanker/Kitchen/main/aaPanel-Kitchen/aapanel-tools.sh  -O aapanel-tools.sh && chmod +x aapanel-tools.sh && clear && ./aapanel-tools.sh
```

### aaPanel 6.8.37 版本
https://github.com/mzwrt/aapanel-6.8.37-backup

```
wget https://raw.githubusercontent.com/mzwrt/aapanel-6.8.37-backup/main/install.sh && bash install.sh && rm -rf install.sh
```

Update pip

```
/www/server/panel/pyenv/bin/python3 -m pip install --upgrade pip
```

```
btpip install pyOpenSSL==24.2.1 -U
```

Disable log upload

```
echo "" > /www/server/panel/script/site_task.py
chattr +i /www/server/panel/script/site_task.py
rm -rf /www/server/panel/logs/request/*
chattr +i -R /www/server/panel/logs/request
```

### aaPanel 6.8.x 优化脚本 | 谨慎使用
感谢原脚本：https://blog.cccyun.cn/post-431.html

```
wget -O aapanel-optimize.sh https://raw.githubusercontent.com/DearTanker/Kitchen/main/aaPanel-Kitchen/aapanel-optimize.sh && bash aapanel-optimize.sh
```



AWS S3 1.4 use other s3

/www/server/panel/plugin/aws_s3/s3lib/client

```
    def build_auth(self):
        config = client(
            's3',
            aws_access_key_id=self.__secret_id,
            aws_secret_access_key=self.__secret_key,
            endpoint_url = 'https://your-endpoint-url',
        )
        return config
```

修改网站备份功能，使其可以备份软链接的源文件
路径 /www/server/panel/class/panelBackup.py 第 400 行
```
        public.ExecShell("cd " + os.path.dirname(
            spath) + " && tar --dereference -zcvf '" + dfile + "' " + self._exclude + " '" + dirname + "' 2>{err_log} 1> /dev/null".format(
            err_log=self._err_log))
```
