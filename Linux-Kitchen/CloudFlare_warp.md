https://pkg.cloudflareclient.com/install

```
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
```
```
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
```
```
apt update -y
```
```
apt install -y cloudflare-warp
```
```
warp-cli register
```
```
warp-cli set-mode proxy
```
```
warp-cli connect
```
```
warp-cli enable-always-on
```
```
warp-cli settings
```
```
warp-cli warp-stats
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
warp-cli disconnect && sleep 3 &&warp-cli connect && sleep 3&& export ALL_PROXY=socks5://127.0.0.1:40000 && curl myip.ipip.net
```
