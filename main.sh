git reset --hard && git pull > /dev/null 2>&1
node .
busybox reboot
exit 1
