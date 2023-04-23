DD Debian 11

```
bash <(wget --no-check-certificate -qO- 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 -port 12345 -p PassWord
```

DD Debian 11 GCP

```
bash <(wget --no-check-certificate -qO- 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 --ip-addr 10.170.0.2 --ip-gate 10.170.0.1 --ip-mask 255.255.255.0 -p PassWord
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

```
reboot
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

Debian Install UFW

```
apt install ufw -y
```

```
ufw allow 12345/tcp
```

```
ufw enable
```

```
ufw status
```


Disabled IPV6

```
echo 'net.ipv6.conf.all.disable_ipv6 =1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 =1' | tee -a /etc/sysctl.conf
sysctl -p
```



Change nameserver to 1.1.1.1

```
sed -i "s/nameserver 8.8.8.8/nameserver 1.1.1.1/g" /etc/resolv.conf
echo 'nameserver 1.0.0.1' | tee -a /etc/resolv.conf
```
```
cat /etc/resolv.conf
```
