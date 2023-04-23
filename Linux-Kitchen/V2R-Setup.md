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
Local Proxy

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
Remote Proxy

```
location /path {
        proxy_pass https://REMOTE_DOMAIN/PATH;
        proxy_set_header Host REMOTE_DOMAIN:443;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-Proto https;
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
/usr/local/bin/v2ray test -config /usr/local/etc/v2ray/config.json
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


### Multi IP in & out sample

```
{
    "inbounds": [
        {
            "protocol": "vmess",
            "listen": "1.1.1.1",
            "port": 12345,
            "tag":"in-01",
            "sniffing":{
                "enabled":true,
                "destOverride":[
                    "http",
                    "tls"
                ]
            },
            "settings": {
                "clients": [
                    {
                        "id": "uuid"
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp"
            }
        },
        {
            "protocol": "vmess",
            "listen": "2.2.2.2",
            "port": 12345,
            "tag":"in-02",
            "sniffing":{
                "enabled":true,
                "destOverride":[
                    "http",
                    "tls"
                ]
            },
            "settings": {
                "clients": [
                    {
                        "id": "uuid"
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp"
            }
        }
    ],
    "routing":{
        "rules":[
            {
                "type":"field",
                "inboundTag":"in-01",
                "outboundTag":"out-01"
            },
            {
                "type":"field",
                "inboundTag":"in-02",
                "outboundTag":"out-02"
            }
        ]
    },
    "outbounds": [
        {
            "sendThrough":"1.1.1.1",
            "protocol":"freedom",
            "settings":{
                "domainStrategy":"UseIP"
            },
            "tag":"out-01"
        },
        {
            "sendThrough":"2.2.2.2",
            "protocol":"freedom",
            "settings":{
                "domainStrategy":"UseIP"
            },
            "tag":"out-02"
        }
    ]
}

```

### liberal-boy’s tls-shunt-proxy sample

```
listen: 0.0.0.0:443
vhosts:
    # 将 example.com 改为你的域名
  - name: www.example.com
    tlsoffloading: true
    managedcert: true
    alpn: h2,http/1.1
    # 如果不需要兼容 tls12, 可改为 tls13
    protocols: tls12,tls13
    http:
      handler: fileServer
      # /var/www/html 是静态网站目录
      args: /var/www/html
    default:
      handler: proxyPass
      args: 1.1.1.1:54301

    # 将 example.com 改为你的域名
  - name: www.example.com
    tlsoffloading: true
    managedcert: true
    alpn: h2,http/1.1
    # 如果不需要兼容 tls12, 可改为 tls13
    protocols: tls12,tls13
    http:
      handler: fileServer
      # /var/www/html 是静态网站目录
      args: /var/www/html
    default:
      handler: proxyPass
      args: 2.2.2.2:54301
```
