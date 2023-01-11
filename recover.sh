#!/bin/bash

# Aceptar solo conexiones SSH desde el servidor 35.190.223.37 y desde la máquina local
iptables -A INPUT -p tcp --dport 22 -s 35.190.223.37 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP

# Aceptar solo conexiones FTP desde máquinas de la red de ehu.eus
iptables -A INPUT -p tcp --dport 21 -s ehu.eus -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j DROP

# No aceptar conexiones HTTP, solo HTTPS
iptables -A INPUT -p tcp --dport 80 -j DROP
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Bloquear conexiones salientes a twitter, facebook y youtube en tu maquina local
iptables -A OUTPUT -d twitter.com -j DROP
iptables -A OUTPUT -d facebook.com -j DROP
iptables -A OUTPUT -d youtube.com -j DROP

#Bloquea cualquier trafico no contemplado en las reglas anteriores
iptables -P INPUT DROP
iptables -P OUTPUT DROP
