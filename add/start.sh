#!/bin/ash

# python3.7 /opt/HTTPAceProxy-master/acehttp.py >/dev/null 2>&1 &

# service apache2 start >/dev/null 2>&1 &

# service cron start >/dev/null 2>&1 &

# cd /opt/linux-x64/
# chmod +x RemoteForkCP
# ./RemoteForkCP $1 >/dev/null 2>&1 &

while true; do
        sleep 600
        rm -rf /tmp/.ACEStream/collected_torrent_files/*
done
