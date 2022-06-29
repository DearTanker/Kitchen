```
sudo passwd root
```

```
hostnamectl set-hostname
```

remove cockpit

```
systemctl stop cockpit
systemctl disable cockpit
firewall-cmd --permanent --remove-service=cockpit
yum remove cockpit* -y
rpm -e cockpit-system
rpm -e cockpit-bridge
rpm -e cockpit-ws
rm -R -f /run/cockpit
rm -R -f /etc/cockpit
rm -R -f /usr/share/cockpit
rm -R -f /var/lib/selinux/targeted/active/modules/100/cockpit
rm -R -f /usr/share/selinux/targeted/default/active/modules/100/cockpit
```

```
dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
dnf distro-sync
```

```
yum update -y
yum install epel-release -y
yum update -y
yum groups install "Development Tools" -y
```

```
yum clean all
```

```
yum autoremove -y
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
```
yum remove --oldinstallonly --setopt installonly_limit=2 kernel
```
```
firewall-cmd --get-default-zone
firewall-cmd --get-active-zones
firewall-cmd --list-services
firewall-cmd --get-services
firewall-cmd --zone=public --list-ports
firewall-cmd --zone=public --list-services
firewall-cmd --reload
firewall-cmd --permanent --add-service=http
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone= public --remove-port=80/tcp --permanent
```

```
echo 'net.ipv6.conf.all.disable_ipv6 =1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 =1' | sudo tee -a /etc/sysctl.conf
sysctl -p
```
