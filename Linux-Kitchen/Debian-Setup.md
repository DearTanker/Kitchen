Set hostname
```
hostnamectl set-hostname
```

Set root passwd

```
sudo passwd root
```

Clean WARRANTY notice

```
rm -rf /etc/motd
```

Check kernel verison

```
uname -r
```

```
echo 'net.ipv4.tcp_congestion_control=bbr' | tee -a /etc/sysctl.conf
echo 'net.core.default_qdisc=fq' | tee -a /etc/sysctl.conf
sysctl -p
```

```
lsmod | grep bbr
```

Change ulimit Open files

```
echo 'root soft nofile infinity' | tee -a /etc/security/limits.conf
echo '*    soft nofile infinity' | tee -a /etc/security/limits.conf
```

```
ulimit -a
```

```
apt update -y
```
```
apt upgrade -y
```
```
apt install wget curl -y
```
```
apt install net-tools -y
```
```
apt full-upgrade -y
```

Remove old kernel

```
uname -a
```

```
dpkg -l | grep linux-image
```
```
dpkg --purge --force-remove-essential 
```


Setup TimeSync

```
apt install systemd-timesyncd -y
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp yes
timedatectl
```

Install Speedtest cli

```
apt-get -y install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
apt-get -y install speedtest
```
```
speedtest
```
