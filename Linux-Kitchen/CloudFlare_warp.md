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
```
```
			{
				"type": "field",
				"outboundTag": "warp",
				"domain": [
					"geosite:openai"
                		]
			}
```
