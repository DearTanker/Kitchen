
```
yum update -y
yum install epel-release -y
yum update -y
yum groups install "Development Tools" -y
```

```
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp yes
timedatectl
```

```
uname -r
```

```
echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf
sysctl -p
```

```
lsmod | grep bbr
```

```
sed -i "s/#DefaultLimitNOFILE=/DefaultLimitNOFILE=infinity/g" /etc/systemd/system.conf
```

```
reboot
```

```
ulimit -a
```

```
rpm -qa | grep kernel
```

```
yum -y remove
```
