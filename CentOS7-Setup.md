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
yum -y install --enablerepo=elrepo-kernel kernel-ml kernel-ml-devel kernel-ml-headers
```
Check kernel list order

```
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
```

Make ML kernel default

```
grub2-set-default 1
```

