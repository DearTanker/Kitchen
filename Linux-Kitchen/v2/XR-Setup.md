

### Install XRay

```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install  --without-geodata
```

### Update dat files

```
wget --no-check-certificate -O XR-update-dat.sh https://raw.githubusercontent.com/DearTanker/Kitchen/main/Linux-Kitchen/v2/XR-update-dat.sh
chmod +x XR-update-dat.sh
./XR-update-dat.sh
```

### Some info

```
---------------------------------------------------
installed: /etc/systemd/system/xray.service
installed: /etc/systemd/system/xray@.service
---------------------------------------------------
installed: /usr/local/bin/xray
installed: /usr/local/etc/xray/*.json
---------------------------------------------------
installed: /usr/local/share/xray/geoip.dat
installed: /usr/local/share/xray/geosite.dat
---------------------------------------------------
installed: /var/log/xray/access.log
installed: /var/log/xray/error.log
---------------------------------------------------
```

### More Usage

```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ help
```


```
ln -s "/usr/local/etc/xray/config.json" xr-config.json
```

### Config Test

```
xray run -test -c /usr/local/etc/xray/config.json
```

```
systemctl enable xray
systemctl is-enabled xray.service
```

```
systemctl restart xray
```

```
systemctl status xray
```

### Remove xray

```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ remove --purge
```
