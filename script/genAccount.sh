#
#!/bin/bash
#Script generate akaun
#

clear

ipAddress=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$ipAddress" = "" ]]; then
		ipAddress=$(wget -qO- ipv4.icanhazip.com)
fi

echo "========================================"
echo -e "Generate Akaun Pengguna"
echo "----------------------------------------"
read -p "Kuantiti Akaun: " totalAccount
read -p "Tamat Tempoh Akaun: " accActive
expDate=$(date -d "$accActive days" +"%Y-%m-%d")
echo "----------------------------------------"
echo "Butiran Akaun Pengguna:"
echo "----------------------------------------"
echo "Alamat IP: $ipAddress"
echo "OpenSSH Port: 22, 2020"
echo "Dropbear Port: 443, 4343"
echo "Squid Port: 8080, 3128"
echo "OpenVPN Config: http://$ipAddress/client.ovpn"
echo "Akaun Aktif Sehingga: $(date -d "$accActive days" +"%d-%m-%Y")"
for (( i=1; i <= $totalAccount; i++ ))
do
	userPass=`cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 5 | head -n 1`;
	useradd -M -N -s /bin/false -e $expDate $userPass
	echo $userPass:$userPass | chpasswd
	echo "$i. Username/Password: $userPass"
done
echo "========================================"