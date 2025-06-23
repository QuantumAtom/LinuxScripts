read -p "Enter port number to forward: " portfwd
read -p "Enter destination ip address: " destip
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv4.ip_foward_update_priority=1

iptables -t nat -A PREROUTING -p tcp --dport portfwd -j DNAT --to-destination destip 
iptables -t nat -A POSTROUTING -o ens0 -s 192.168.0.0/24 -j MASQUERADE
iptables -t nat -A PREROUTING -i ens0 -p tcp --dport portfwd -j DNAT --to-destination destip
