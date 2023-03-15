创建资源组

```
az group create --name 资源组名称 --location southeastasia
```

创建虚拟机

```
az vm create --resource-group 资源组名称 --name VM名称 --image Debian:debian-11:11-gen2:latest --authentication-type password --admin-username VM用户名 --admin-password VM密码 --size Standard_B1s --os-disk-size-gb 64
```

防火墙开放全端口

```
az vm open-port -n VM名称 -g 资源组名称 --port 0-65535
