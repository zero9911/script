#!/bin/bash
#-----------------------------
#CREATE BY MKSSHVPN AUTOSCRIPT
#Version : DEBIAN 7.X ONLY !!
#LAST UPDATE : 30/1/2017
#TELEGRAM : @mk_let
#WHATSAPP : +60162771064
#-----------------------------

#info
echo "=================================================="
echo "SUPPORT SERVER GOOGLE CLOUD/DIGITAL OCEAN/LINODE/etc"
echo "DEBIAN 7.X 64/32 BIT ONLY"
echo "=================================================="

clear 
#set time zone malaysia
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
CHECK AND INSTALL IT
COMPLETE 1%
"
apt-get -y install wget curl
clear
echo "
INSTALL COMMANDS
COMPLETE 15%
"

#install sudo
apt-get -y install sudo
apt-get -y install wget

#iptables
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -F
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.16.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.1.0.0/16 -o eth0 -j MASQUERADE
iptables-save

#installing squid3
aptitude -y install squid3
rm -f /etc/squid3/squid.conf

#restoring squid config with open port proxy 8080,7166
wget -P /etc/squid3/ "https://raw.githubusercontent.com/zero9911/script/master/script/squid.conf"
sed -i "s/ipserver/$IP/g" /etc/squid3/squid.conf
service squid3 restart
cd
clear

#Tunnel
apt-get install stunnel4 -y
wget -P /etc/stunnel/ "https://raw.githubusercontent.com/zero9911/script/master/script/stunnel.conf"
openssl genrsa -out key.pem 2048
wget -P /etc/stunnel/ "https://raw.githubusercontent.com/zero9911/script/master/script/stunnel.pem"
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart
clear

#install vnstat
apt-get -y install vnstat
vnstat -u -i eth0
sudo chown -R vnstat:vnstat /var/lib/vnstat
service vnstat restart

clear
echo 
"INSTALL MENU COMMAND
39% COMPLETE "

# command script
wget -O /usr/bin/menu "https://raw.githubusercontent.com/zero9911/script/master/script/mainMenu.sh"
wget -O /usr/bin/01 "https://raw.githubusercontent.com/zero9911/script/master/script/trialUserAccount.sh"
wget -O /usr/bin/02 "https://raw.githubusercontent.com/zero9911/script/master/script/genAccount.sh"
wget -O /usr/bin/03 "https://raw.githubusercontent.com/zero9911/script/master/script/createUserAccount.sh"
wget -O /usr/bin/04 "https://raw.githubusercontent.com/zero9911/script/master/script/renewUserAccount.sh"
wget -O /usr/bin/05 "https://raw.githubusercontent.com/zero9911/script/master/script/changePasswordAccount.sh"
wget -O /usr/bin/06 "https://raw.githubusercontent.com/zero9911/script/master/script/lockAccount.sh"
wget -O /usr/bin/07 "https://raw.githubusercontent.com/zero9911/script/master/script/unlockAccount.sh"
wget -O /usr/bin/08 "https://raw.githubusercontent.com/zero9911/script/master/script/deleteUserAccount.sh"
wget -O /usr/bin/09 "https://raw.githubusercontent.com/zero9911/script/master/script/listAccounts.sh"
wget -O /usr/bin/10 "https://raw.githubusercontent.com/zero9911/script/master/script/OnlineUserAccounts.sh"
wget -O /usr/bin/11 "https://raw.githubusercontent.com/zero9911/script/master/script/monitorBandwidth.sh"
wget -O /usr/bin/12 "https://raw.githubusercontent.com/zero9911/script/master/script/serverPerformanceMonitor.sh"
wget -O /usr/bin/13 "https://raw.githubusercontent.com/zero9911/script/master/script/speedtest_cli.py"
wget -O /usr/bin/14 "https://raw.githubusercontent.com/zero9911/script/master/script/DetailsServer.sh"
wget -O /usr/bin/15 "https://raw.githubusercontent.com/zero9911/script/master/script/servicesRestart.sh"

chmod +x /usr/bin/menu
chmod +x /usr/bin/01
chmod +x /usr/bin/02
chmod +x /usr/bin/03
chmod +x /usr/bin/04
chmod +x /usr/bin/05
chmod +x /usr/bin/06
chmod +x /usr/bin/07
chmod +x /usr/bin/08
chmod +x /usr/bin/09
chmod +x /usr/bin/10
chmod +x /usr/bin/11
chmod +x /usr/bin/12
chmod +x /usr/bin/13
chmod +x /usr/bin/14
cd

#ssh
sed -i 's/#Banner/Banner/g' /etc/ssh/sshd_config
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
wget -O /etc/issue.net " https://raw.githubusercontent.com/zero9911/script/master/script/banner"

clear
echo 
"65% COMPLETE"

#install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 110"/g' /etc/default/dropbear
echo "/bin/false" » /etc/shells

#installing webmin
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
apt-get update
apt-get -y install webmin
#disable webmin https
sed -i "s/ssl=1/ssl=0/g" /etc/webmin/miniserv.conf
/etc/init.d/webmin restart
cd

#config upload
wget -O /home/vps/public_html/client.ovpn " https://raw.githubusercontent.com/zero9911/script/master/script/max.ovpn"
sed -i "s/ipserver/$myip/g" /home/vps/public_html/max.ovpn
cd

clear

echo "
BLOCK TORRENT PORT INSTALL
COMPLETE 94%
"
#bonus block torrent
wget https://raw.githubusercontent.com/zero9911/script/master/script/torrent.sh
chmod +x  torrent.sh
./torrent.sh

#add user
useradd -m -g users -s /bin/bash mklet
echo "mklet:mklet" | chpasswd

clear
echo 
"COMPLETE 100%"

echo "RESTART SERVICE"
service squid3 restart
service vnstat restart
service webmin restart
service dropbear restart
service ssh restart
echo " DONE RESTART SERVICE"

clear

echo "===============================================--"
echo "                             "
echo "  === AUTOSCRIPT FROM MKSSHVPN === "
echo "WEBMIN : http://ipserver:10000 "
echo "OPENVPN PORT : 59999"
echo "DROPBEAR PORT : 22,443"
echo "PROXY PORT : 7166,8080"
echo "SSL/TLS PORT : 4321"
echo "SERVER TIME/LOCATION : KUALA LUMPUR +8"
echo "TORRENT PORT HAS BLOCK BY SCRIPT"
echo "CONTACT OWNER SCRIPT"
echo "WHATSAPP : +60162771064"
echo "TELEGRAM : @mk_let"
echo "For SWAP RAM PLEASE CONTACT OWNER"
echo "  === PLEASE REBOOT TAKE EFFECT  ===  "
echo "                                  "
echo "=================================================="
rm install.sh
