#git submodule update --init
git pull || git reset --hard && git pull
node .
busybox reboot
exit 1
