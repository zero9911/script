#
#!/bin/bash
#Script delete akaunSSH
#

clear

read -p "Nama Pengguna Yang Ingin Dipadam: " userName
egrep "^$userName" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Anda Pasti Memadam Akaun [y/n]: " -e -i y delAccount
	if [[ "$delAccount" = 'y' ]]; then
		passwd -l $userName
		userdel $userName
		echo "Berjaya Padam Akaun [$userName]"
	else
		echo "Gagal Padam Akaun [$userName]"
	fi
else
	echo "Nama Pengguna [$userName] Tiada Dalam Senarai!"
	exit 1
fi
echo "========================================"