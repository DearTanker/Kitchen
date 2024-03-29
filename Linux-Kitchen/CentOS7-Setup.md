Set hostname
```
hostnamectl set-hostname
```

Set root passwd

```
sudo passwd root
```

Check kernel verison

```
uname -r
```

Install Latest ML kernel

```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum -y install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
yum -y install --enablerepo=elrepo-kernel kernel-lt kernel-lt-devel kernel-lt-headers
```
Check kernel list order

```
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
```
or
```
egrep ^menuentry /etc/grub2-efi.cfg | cut -f 2 -d \'
```

Make ML kernel default

```
grub2-set-default 1
```
```
sed -i "s/#DefaultLimitNOFILE=/DefaultLimitNOFILE=infinity/g" /etc/systemd/system.conf
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
```
echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf
sysctl -p
```
```
lsmod | grep bbr
```
```
yum update -y
yum install epel-release -y
yum update -y
yum install bind-utils net-tools wget ntp policycoreutils-python chrony git dnf jq -y
yum groups install "Development Tools" -y
```
```
systemctl enable chronyd
systemctl start chronyd
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp yes
timedatectl
```
```
yum install vnstat -y
vnstat -i eth0 -u
vnstatd -d
sed -i 's/DaemonUser ""/DaemonUser "root"/g' /etc/vnstat.conf
sed -i 's/DaemonGroup ""/DaemonGroup "root"/g' /etc/vnstat.conf
sed -i "s/User=vnstat/User=root/g" /usr/lib/systemd/system/vnstat.service
service vnstat start
chkconfig vnstat on
```

禁用 IPv6
```
echo 'net.ipv6.conf.all.disable_ipv6 =1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 =1' | tee -a /etc/sysctl.conf
sysctl -p
```
