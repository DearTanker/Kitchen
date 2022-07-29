#!/bin/bash

curl -so /tmp/trackers_all.txt https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt
  if [ -e "/tmp/trackers_all.txt" ]; then
    Newtrackers="Session\\AdditionalTrackers=$(awk '{if(!NF){next}}1' /tmp/trackers_all.txt|sed ':a;N;s/\n/\\n/g;ta' )"
    Oldtrackers="`grep AdditionalTrackers= /mnt/user/appdata/qbittorrent/qBittorrent/qBittorrent.conf`"
    echo $Newtrackers >/tmp/Newtrackers.txt
    if [ "$Newtrackers" == "$Oldtrackers" ]; then
      echo trackers文件一样,不需要更新。
    else
      sed -i '/Session\\AdditionalTrackers=/r /tmp/Newtrackers.txt' /mnt/user/appdata/qbittorrent/qBittorrent/qBittorrent.conf
      sed -i '0,/^Session\\AdditionalTrackers=.*/{//d;}' /mnt/user/appdata/qbittorrent/qBittorrent/qBittorrent.conf
      echo 已更新trackers。
    fi
    rm /tmp/trackers_all.txt /tmp/Newtrackers.txt
  else
    echo 更新文件未正确下载，更新未成功，请检查网络。
  fi
