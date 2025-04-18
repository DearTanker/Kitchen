# nexttrace

```
bash <(curl -Ls https://raw.githubusercontent.com/sjlleo/nexttrace/main/nt_install.sh)
```
```
curl nxtrace.org/nt | bash
```

# Speedtest cli

Ubuntu/Debian

```
apt-get -y install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt-get install speedtest
```

Fedora/Centos/Redhat

```
yum -y install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | bash
yum -y install speedtest
```
Run it
```
speedtest
```

# Fast cli

Linux AMD64
```
wget https://github.com/ddo/fast/releases/latest/download/fast_linux_amd64 -O fast
chmod +x fast
```
Linux ARM
```
wget https://github.com/ddo/fast/releases/latest/download/fast_linux_arm -O fast
chmod +x fast
```
Run it
```
./fast
```

---

mikkelam fast-cli

```
curl -L https://github.com/mikkelam/fast-cli/releases/latest/download/fast-cli_linux_amd64.tar.gz  | tar xz
```
```
./fast-cli
```


# iPerf3

```
apt install iperf3 -y
```
Run as Server
```
iperf3 -s
```
Test from Client
```
iperf3 -c xxx.xxx.xxx.xxx -P 10 -R
```

# nekoneko cloud's linux net optimize tools

```
wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
```

```
wget https://raw.githubusercontent.com/DearTanker/Kitchen/main/Linux-Kitchen/Shells/nekoneko_linux_net_optimize_tools.sh -O tools.sh && bash tools.sh
```