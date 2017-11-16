#
#!/bin/bash
#Script menambah masa aktif akaun SSH
#

clear

echo "========================================"
echo -e "Tambah Tarikh Tamat Tempoh Akaun"
echo "----------------------------------------"
read -p "Nama Pengguna: " userName
egrep "^$userName" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Akaun [$userName] Aktif Sehingga: " expDay
	expDate=$(chage -l $userName | grep "Account expires" | awk -F": " '{print $2}')
	todayDate=$(date -d "$expDate" +"%Y-%m-%d")
	expAccount=$(date -d "$todayDate + $expDay days" +"%Y-%m-%d")
	chage -E "$expAccount" $userName
	passwd -u $userName
else
	echo "Nama Pengguna [$userName] Tiada Dalam Senarai!"
	exit 1
fi
echo "========================================"