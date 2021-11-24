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
wget --no-check-certificate -O update-v2dat-v2.sh https://git.io/JMvsR
chmod +x update-v2dat-v2.sh
./update-v2dat-v2.sh
```

### Remove V2Ray

```
# bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh) --remove
```
