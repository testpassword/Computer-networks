iptables -F
echo "Запретить передачу только тех пакетов, которые отправлены на TCP-порт, заданный в настройках утилиты nc."
iptables -A OUTPUT -j REJECT -o enp0s3 -p tcp --dport 8090

echo "Запретить приём только тех пакетов, которые отправлены с UDP-порта утилиты nc."
iptables -A INPUT -j REJECT -i enp0s3 -p udp -sport 8090

echo "Запретить передачу только тех пакетов, которые отправлены с IP-адреса компьютера А."
iptables -A OUTPUT -j REJECT -o enp0s3 -s 7.8.1.2

echo "Запретить приём только тех пакетов, которые отправлены на IPадрес компьютера Б."
iptables -A INPUT -j REJECT -i enp0s3 -d 7.8.3.2/30

echo "Запретить приём и передачу ICMP-пакетов, размер которых превышает 1000 байт, а поле TTL при этом меньше 10."
iptables -A OUTPUT -o enp0s3 -p icmp -m length ! --length 0:1000 -m ttl --ttl-lt 10 -j REJECT