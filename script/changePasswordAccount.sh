#
#!/bin/bash
#Script tukar password akaun SSH
#

clear
echo "========================================"
echo -e "Ganti Kata Laluan Nama Pengguna"
echo "----------------------------------------"
read -p "Nama Pengguna: " userName
egrep "^$userName" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Kata Laluan Baru [$userName]: " newPassword
	read -p "Msukkan semula Kata Laluan [$userName]: " retypePassword
	if [[ $newPassword = $retypePassword ]]; then
		echo "Berjaya Ganti Kata Laluan [$userName]"
	else
		echo "Gagal Ganti Kata Laluan [$userName]"
	fi
else
	echo "Nama Pengguna [$userName] Tiada Dalam Senarai!"
	exit 1
fi
echo "========================================"
