#
#!/bin/bash
#Script menambah user ssh
#

clear

ipAddress=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$ipAddress" = "" ]]; then
		ipAddress=$(wget -qO- ipv4.icanhazip.com)
fi

echo "========================================"
echo -e "Buat Akaun Pengguna"
echo "----------------------------------------"
read -p "Nama Pengguna: " userName
egrep "^$userName" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Nama Pengguna [$userName] sudah ada!"
	exit 1
else
	read -p "Kata Laluan: " passWord
	read -p "Tamat Tempoh Akaun: " expDay
	expDate=$(date -d "$expDay days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expDate $userName
	echo "----------------------------------------"
	echo "Butiran Akaun Pengguna:"
	echo "----------------------------------------"
	echo "Alamat IP: $ipAddress"
	echo "Dropbear Port: 443, 4343"
	echo "OpenSSH Port: 22, 2020"
	echo "Squid Port: 8080, 3128"
	echo "OpenVPN Config: http://$ipAddress/client.ovpn"
	echo "Nama Pengguna: $userName"
	echo "Kata Laluan: $passWord"
	echo "Akaun Aktif Sehingga: $expDate"
fi
echo "========================================"