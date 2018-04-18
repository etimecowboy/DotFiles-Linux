#!/bin/bash
# Run on office desktop, and sync from laptop
# Inputs:
#     - $1 : source path
#     - TODO: $2 : dry-run flag -n
# replace / in the source path with @ (if you use ! then \! is required)
r=$1 | sed "s/\//@/g"
rsync -rstpvlH --progress --delete $1 xin@172.19.132.234:/home/xin/51talk_dell_desktop_kdeneon/"$r"
