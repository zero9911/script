#
#!/bin/bash
#Script create akaun trial
#

ipAddress=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$ipAddress" = "" ]]; then
		ipAddress=$(wget -qO- ipv4.icanhazip.com)
fi

userName=`</dev/urandom tr -dc a-z0-9 | head -c5`
passWord=`</dev/urandom tr -dc z-z0-9 | head -c5`
expDays="1"

useradd -e `date -d "$expDays days" +"%Y-%m-%d"` -s /bin/false -M $userName
expDate=$(date -d "$expDay days" +"%Y-%m-%d")
echo -e "$passWord\n$passWord\n"|passwd $userName &> /dev/null

echo "========================================"
echo -e "Akaun Trial: Butiran Akaun Pengguna"
echo "----------------------------------------"
echo -e "Alamat IP: $ipAddress" 
echo -e "OpenSSH Port: 22, 2020"
echo -e "Dropbear Port: 443, 4343"
echo -e "Squid Port: 8080, 3128"
echo -e "OpenVPN Config: http://$ipAddress/client.ovpn"
echo -e "Nama Pengguna: $userName"
echo -e "Kata Laluan: $passWord"
echo "Akaun Aktif Sehingga: $expDate"
echo "========================================"
