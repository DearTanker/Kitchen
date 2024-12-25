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
apt-get update && apt-get install cloudflare-warp
```

Install 2024.6.497-1

```
wget https://pkg.cloudflareclient.com/pool/bookworm/main/c/cloudflare-warp/cloudflare-warp_2024.6.497-1_amd64.deb
sudo apt --fix-broken install ./cloudflare-warp_2024.6.497-1_amd64.deb
```

Disable log to free disk space

```
echo "" > /var/log/cloudflare-warp/cfwarp_service_log.txt
chattr +i /var/log/cloudflare-warp/cfwarp_service_log.txt
```
```
ln /dev/null /var/log/cloudflare-warp/cfwarp_service_log.txt -sfv
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
