cd

apt-get -y update

apt-get -y remove openssh-server

apt-get -y purge openssh-server

apt-get -y install openssh-server

rm /etc/ssh/sshd_config

wget -O /etc/ssh/sshd_config "https://raw.githubusercontent.com/zero9911/tong/master/etc/sshd_config"

service ssh restart

passwd 

rm vps.sh
