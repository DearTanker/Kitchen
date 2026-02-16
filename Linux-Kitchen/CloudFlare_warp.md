[https://pkg.cloudflareclient.com](https://pkg.cloudflareclient.com)

[https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/deployment/manual-deployment](https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/deployment/manual-deployment)

Add cloudflare gpg key
```
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
```

Add this repo to your apt repositories
```
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
```


Install
```
apt-get update && apt-get install cloudflare-warp -y
```

Install 2024.6.497-1

```
wget https://pkg.cloudflareclient.com/pool/bookworm/main/c/cloudflare-warp/cloudflare-warp_2024.6.497-1_amd64.deb
sudo apt --fix-broken install ./cloudflare-warp_2024.6.497-1_amd64.deb
```

Disable log to free disk space

```
systemctl stop warp-svc
```

```
rm -rf /var/log/cloudflare-warp
mkdir -p /var/log/cloudflare-warp
mount -t tmpfs -o size=1M,mode=0755 tmpfs /var/log/cloudflare-warp
```
fstab
```
tmpfs /var/log/cloudflare-warp tmpfs size=1M,mode=0755 0 0
```
```
rm -f /var/log/cloudflare-warp/cfwarp_daemon_dns.txt
touch /var/log/cloudflare-warp/cfwarp_daemon_dns.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_daemon_dns.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_boring.txt
touch /var/log/cloudflare-warp/cfwarp_service_boring.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_boring.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_captive_portal.txt
touch /var/log/cloudflare-warp/cfwarp_service_captive_portal.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_captive_portal.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_connection_stats.txt
touch /var/log/cloudflare-warp/cfwarp_service_connection_stats.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_connection_stats.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_dex.txt
touch /var/log/cloudflare-warp/cfwarp_service_dex.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_dex.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_dns_stats.txt
touch /var/log/cloudflare-warp/cfwarp_service_dns_stats.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_dns_stats.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_dynamic_log.txt
touch /var/log/cloudflare-warp/cfwarp_service_dynamic_log.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_dynamic_log.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_log.txt
touch /var/log/cloudflare-warp/cfwarp_service_log.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_log.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_stats.txt
touch /var/log/cloudflare-warp/cfwarp_service_stats.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_stats.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_taskdump.txt
touch /var/log/cloudflare-warp/cfwarp_service_taskdump.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_taskdump.txt

rm -f /var/log/cloudflare-warp/cfwarp_service_network_health_stats.txt
touch /var/log/cloudflare-warp/cfwarp_service_network_health_stats.txt
mount --bind /dev/null /var/log/cloudflare-warp/cfwarp_service_network_health_stats.txt
```
```
echo "" > /var/log/cloudflare-warp/cfwarp_daemon_dns.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_boring.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_captive_portal.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_connection_stats.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_dex.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_dns_stats.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_dynamic_log.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_log.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_stats.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_taskdump.txt
echo "" > /var/log/cloudflare-warp/cfwarp_service_network_health_stats.txt
```
```
ln /dev/null /var/log/cloudflare-warp/cfwarp_daemon_dns.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_boring.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_captive_portal.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_connection_stats.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_dex.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_dns_stats.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_dynamic_log.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_log.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_stats.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_taskdump.txt -sfv
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_network_health_stats.txt -sfv
```

Usage

```
warp-cli registration new
```
```
warp-cli mode proxy
```
```
warp-cli connect
```
```
warp-cli settings
```
```
warp-cli tunnel stats
```


```
  "outbounds": [
  	{
		"protocol": "freedom",
		"settings": {},
		"tag": "free"
	},
	{
		"tag": "warp",
		"protocol": "socks",
       	"settings": {
		"servers": [
			{
			    "address": "127.0.0.1",
			    "port": 40000, 
			    "users": []
			}
		]
		}
	}
  ],
  "routing": {
  		"domainStrategy": "IPOnDemand",
      "rules": [
        {
            "type": "field",
            "outboundTag": "warp",
            "domain": ["geosite:openai","domain:ip.sb"]
        }
      ]
    }
}
```

```
warp-cli disconnect && sleep 3 &&warp-cli connect && sleep 3&& export ALL_PROXY=socks5://127.0.0.1:40000 && curl myip.ipip.net && export ALL_PROXY= && curl myip.ipip.net
```
