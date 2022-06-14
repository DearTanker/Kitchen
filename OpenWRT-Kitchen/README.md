```
cd /usr/share/passwall2/
wget --no-check-certificate -O https://raw.githubusercontent.com/DearTanker/Kitchen/main/OpenWRT-Kitchen/op-passwall2-dat-rule-update.sh
chmod +x op-passwall2-dat-rule-update.sh
```
Scheduled Tasks
```
0 5 * * * /usr/share/passwall2/op-passwall2-dat-rule-update.sh
```
