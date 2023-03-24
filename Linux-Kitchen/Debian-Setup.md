DD Debian 11

```
bash <(wget --no-check-certificate -qO- 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 -p PassWord
```

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
apt update -y && apt dist-upgrade -y
```
```
apt install wget curl net-tools -y
```
```
apt autoremove -y
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

Disabled IPV6

```
echo 'net.ipv6.conf.all.disable_ipv6 =1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 =1' | sudo tee -a /etc/sysctl.conf
sysctl -p
```
