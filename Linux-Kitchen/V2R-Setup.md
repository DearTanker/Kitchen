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

```
location /path
{
  if ($http_upgrade != "websocket") {
      return 404;
  }
  proxy_redirect off;
  proxy_pass http://127.0.0.1:12345;
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection "upgrade";
  proxy_set_header Host $host;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```

### Some info

```
installed: /usr/local/bin/v2ray
installed: /usr/local/bin/v2ctl
installed: /usr/local/share/v2ray/geoip.dat
installed: /usr/local/share/v2ray/geosite.dat
installed: /usr/local/etc/v2ray/config.json
installed: /var/log/v2ray/
installed: /var/log/v2ray/access.log
installed: /var/log/v2ray/error.log
installed: /etc/systemd/system/v2ray.service
installed: /etc/systemd/system/v2ray@.service
```

### Install V2Ray

```
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
```
```
touch /usr/local/share/v2ray/.undat
```

```
ln -s "/usr/local/etc/v2ray/config.json"
```
```
/usr/local/bin/v2ray -test -config /usr/local/etc/v2ray/config.json
```
```
systemctl enable v2ray
systemctl is-enabled v2ray.service
```
```
systemctl restart v2ray
```
```
systemctl status v2ray
```

### Update dat files

```
wget --no-check-certificate -O update-v2dat-v2.sh https://raw.githubusercontent.com/DearTanker/Kitchen/main/Linux-Kitchen/update-v2dat-v2.sh
chmod +x update-v2dat-v2.sh
./update-v2dat-v2.sh
```

### Remove V2Ray

```
# bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh) --remove
```
