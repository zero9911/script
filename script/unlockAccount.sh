#
#!/bin/bash
#Script unblock akaun SSH
#

clear

read -p "Nama pengguna yang akan di buka kunci: " userNama
passwd -u $userNama
echo "========================================"
