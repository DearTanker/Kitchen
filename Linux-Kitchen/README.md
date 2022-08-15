```
wget --no-check-certificate -O update-v2dat-v2.sh https://raw.githubusercontent.com/DearTanker/Kitchen/main/Linux-Kitchen/update-v2dat-v2.sh
chmod +x update-v2dat-v2.sh
./update-v2dat-v2.sh
```

```
https://github.com/DearTanker/Kitchen/Linux-Kitchen/raw/main/xom.tar.gz
```

Speedtest cli

Ubuntu/Debian

```
apt-get -y install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt-get install speedtest
```

Fedora/Centos/Redhat

```
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
yum -y install speedtest
```
Run it
```
speedtest
```

Fast cli

Linux AMD64
```
wget https://github.com/ddo/fast/releases/latest/download/fast_linux_amd64 -O fast
chmod +x fast
```
Linux ARM
```
wget https://github.com/ddo/fast/releases/latest/download/fast_linux_arm -O fast
chmod +x fast
```
Run it
```
./fast
```
