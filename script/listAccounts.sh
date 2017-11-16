#
#!/bin/bash
#Script senarai user
#

clear
echo "========================================"
echo "PID       Nama Pengguna       Tamat Tempoh    "
echo "-------------------------------------------------------------------"
while read expUser
do
       userAccount="$(echo $expUser | cut -d: -f1)"
       userID="$(echo $expUser | grep -v nobody | cut -d: -f3)"
       expDate="$(chage -l $userAccount | grep "Account expires" | awk -F": " '{print $2}')"
       if [[ $userID -ge 1000 ]]; then
       	printf "%-17s %2s\n" "$userAccount" "$expDate"
       fi
done < /etc/passwd
totalAccount="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------------------------------------------"
echo "Jumlah Akaun: $totalAccount user"
echo "========================================"

