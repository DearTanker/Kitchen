### Install AAPanel

Debian
```
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && bash install.sh
```
CentOS
```
yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh
```

Update pip

```
/www/server/panel/pyenv/bin/python3.7 -m pip install --upgrade pip
```

Disable log upload

```
echo "" > /www/server/panel/script/site_task.py
chattr +i /www/server/panel/script/site_task.py
rm -rf /www/server/panel/logs/request/*
chattr +i -R /www/server/panel/logs/request
```

```
wget -O optimize.sh https://raw.githubusercontent.com/chenjinnian/bt_clean/master/optimize_aapanel.sh && bash optimize.sh
```
