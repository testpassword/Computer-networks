function forward_icmp_packets() {
  # 1-ый параметр: IP, куда направляется пакет
  # 2-ой параметр: IP, куда перенаправить пакет
  # 3-ой параметр: порт, куда перенаправить
  # 4-ой параметр: порт, откуда перенаправить
  case "$#" in
    "2")
      echo "Настройка переадресации"
      iptables -t nat -A PREROUTING -i enp0s3 -p icmp -d "$1" -j DNAT --to-destination "$2"
      ;;
    "3")
      echo "Настройка переадресации с заданием порта на который отправлять пакет"
      iptables -t nat -A PREROUTING -i enp0s3 -p icmp -d "$1" -j DNAT --to-destination "$2":"$3"
      ;;
    "4")
      echo "Настройка переадресации с заданием порта на который отправлять пакет и откуда он пришёл"
      iptables -t nat -A PREROUTING -i enp0s3 -p icmp -d "$1" --dport="$4" -j DNAT --to-destination "$2":"$3"
      ;;
    *)
      echo "Неверно задано количество аргументов"
      exit
      ;;
  esac
  iptables -t filter -A FORWARD -p icmp -d "$2" -j ACCEPT
}

case ${2} in
  "IPV4")
    hosts=("" "7.8.1.2" "7.8.2.2" "7.8.1.1" "7.8.3.2")
    ;;
  "IPV6")
    hosts=("" "::ffff:0708:0102" "::ffff:0708:0202" "::ffff:0708:0101" "::ffff:0708:0302")
    ;;
  *)
    echo "Не выбран режим адресации"
    exit
    ;;
esac
case ${1} in
  "1")
    iptables -t nat -F
    forward_icmp_packets_from_to "${hosts[1]}" "${hosts[3]}" 55001
    ;;
  "2")
    iptables -t nat -F
    forward_icmp_packets_from_to "${hosts[4]}" "${hosts[3]}" 55002
    ;;
  "3")
    iptables -t nat -F
    forward_icmp_packets_from_to "${hosts[3]}" "${hosts[1]}" 55001 55004
    forward_icmp_packets_from_to "${hosts[3]}" "${hosts[2]}" 55002 55001
    forward_icmp_packets_from_to "${hosts[3]}" "${hosts[4]}" 55004 55002
    ;;
  "4")
    iptables -t nat -F
    forward_icmp_packets_from_to "${hosts[2]}" "${hosts[3]}" 55004
    ;;
  *)
    echo "Узел задан некорректно"
    ;;
esac