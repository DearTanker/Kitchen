#!/usr/bin/env bash

set -e

xray_folder="/usr/local/share/xray/"

GREEN='\033[0;32m'
NC='\033[0m'

GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

echo -e "${GREEN}>>> change directory...${NC}"
echo -e "${GREEN}>>> ensure directory exists: $xray_folder${NC}"
if [ ! -d "$xray_folder" ]; then
	echo -e "${GREEN}>>> creating directory $xray_folder${NC}"
	if ! mkdir -p "$xray_folder"; then
		echo "Error: failed to create directory $xray_folder" >&2
		exit 1
	fi
fi

# change into the directory, fail if not possible
cd "$xray_folder" || { echo "Error: cannot change directory to $xray_folder" >&2; exit 1; }

echo -e "${GREEN}>>> delete old dat files...${NC}"
rm -f geoip.dat geosite.dat

echo -e "${GREEN}>>> downloading geoip.dat files...${NC}"
curl -L -O $GEOIP_URL

echo -e "${GREEN}>>> downloading geosite.dat files...${NC}"
curl -L -O $GEOSITE_URL

echo -e "${GREEN}Done!${NC}"
