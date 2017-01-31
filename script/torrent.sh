#MKSSHVPN AUTOSCRIPT 

iptables -A INPUT -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A INPUT -m string --algo bm --string "peer_id=" -j REJECT
iptables -A INPUT -m string --algo bm --string ".torrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "announce.php?passkey=" -j REJECT
iptables -A INPUT -m string --algo bm --string "torrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "info_hash" -j REJECT
iptables -A INPUT -m string --algo bm --string "/default.ida?" -j REJECT
iptables -A INPUT -m string --algo bm --string ".exe?/c+dir" -j REJECT
iptables -A INPUT -m string --algo bm --string ".exe?/c_tftp" -j REJECT
iptables -A INPUT -m string --string "peer_id" --algo kmp -j REJECT
iptables -A INPUT -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A INPUT -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A INPUT -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A INPUT -m string --string "announce.php?passkey=" --algo kmp -j REJECT
iptables -A INPUT -m string --string "find_node" --algo kmp -j REJECT
iptables -A INPUT -m string --string "info_hash" --algo kmp -j REJECT
iptables -A INPUT -m string --string "get_peers" --algo kmp -j REJECT
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".torrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j REJECT
iptables -A FORWARD -m string --algo bm --string "torrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "info_hash" -j REJECT
iptables -A FORWARD -m string --algo bm --string "/default.ida?" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".exe?/c+dir" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".exe?/c_tftp" -j REJECT
iptables -A FORWARD -m string --string "peer_id" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "find_node" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "info_hash" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "get_peers" --algo kmp -j REJECT
iptables -A OUTPUT -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "peer_id=" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".torrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "announce.php?passkey=" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "torrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "info_hash" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "/default.ida?" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".exe?/c+dir" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".exe?/c_tftp" -j REJECT
iptables -A OUTPUT -m string --string "peer_id" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "announce.php?passkey=" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "find_node" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "info_hash" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "get_peers" --algo kmp -j REJECT
iptables -A INPUT -p tcp --dport 25 -j REJECT   
iptables -A FORWARD -p tcp --dport 25 -j REJECT 
iptables -A OUTPUT -p tcp --dport 25 -j REJECT 
iptables-save
rm torrent.sh
