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



#para saber la direccion ip de una pagina nslookup google.com
#para ver sus puertos nmap ip
#para saber el sistema operativo nmap -O -v ip / nmap -sS -sV 192.168.1.38 
#para saber maquinas activas traceroute ip
#firewall nmap –mtu 32 –send-eth –data-length 50 –source-port 53 -PN –ip-options «\1\8\3\4» 192.168.1.34

#pag web https://www.foc.es/2021/08/18/5729-nmap-es-una-aplicacion-multiplataforma-nmap-para-linux-y-mac-zenmap-para-windows-que-permite-rastrear-puertos-descubrir-hosts-activos-analizar-mediante-scripts-las-versiones-de-los-servicios-e-in.html
