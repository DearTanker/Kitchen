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
