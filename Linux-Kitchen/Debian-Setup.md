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

```
ulimit -a
```

```
apt update -y
apt upgrade -y
apt install wget curl -y
apt install net-tools -y
```

```
apt full-upgrade -y
```

Setup TimeSync

```
apt install systemd-timesyncd

timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp yes
timedatectl

```
