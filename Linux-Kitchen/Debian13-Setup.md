Set hostname
```
hostnamectl set-hostname
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
apt install wget curl unzip net-tools sudo htop iotop python3 lsb-release gpg vnstat iperf3 jq bc netcat-traditional bind9-dnsutils iproute2 -y
```
```
apt autoremove -y
```

```
reboot
```

Remove old kernel

```
wget https://raw.githubusercontent.com/DearTanker/Kitchen/main/Linux-Kitchen/Shells/debian_clean_old_kernels.sh
chmod +x debian_clean_old_kernels.sh
./debian_clean_old_kernels.sh
```

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
echo 'net.ipv6.conf.all.disable_ipv6 =1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 =1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' | tee -a /etc/sysctl.conf
sysctl -p
```
