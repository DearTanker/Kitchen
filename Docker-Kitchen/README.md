Fix UFW with Docker

/etc/default/docker

```
DOCKER_OPTS = "--iptables=false"
```

```
systemctl restart docker
```
