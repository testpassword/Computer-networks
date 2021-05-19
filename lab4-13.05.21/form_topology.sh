function configure_eth() {
    echo "Настройка интерфейсов"
    ip "$net_param""$mask" a add "$1" dev enp0s3
}

function add_route_to() {
    echo "Добавление маршрута"
    ip "$net_param" ro add default via "$1"
}

function ping_to() {
    echo "Проверка утилитой ping"
    for i in "${1[@]}"
    do
      ping "${hosts[$i]}" -c 2
    done
}

if [ $# -lt 2 ]
  then
    echo "Необходимо задать номер хоста и режим адресации"
    exit
fi
# i-элемент == номеру хоста, а 0-вой оставим пустым для удобства обращения
case ${2} in
  "IPV4")
    hosts=("" "7.8.1.2" "7.8.2.2" "7.8.1.1" "7.8.3.2")
    net_param=""
    mask="/30"
    ;;
  "IPV6")
    hosts=("" "::ffff:0708:0102" "::ffff:0708:0202" "::ffff:0708:0101" "::ffff:0708:0302")
    net_param="-6"
    mask="/126"
    ;;
  *)
    echo "Не выбран режим адресации"
    exit
    ;;
esac
sysctl -w net.ipv4.ip_forwarding = 1
sysctl -w net.ipv4.conf.all.rp_filter = 1
ip link set enp0s3 up
ip a flush enp0s3
case ${1} in
    "1")
        configure_eth "${hosts[1]}"
        add_route_to "${hosts[3]}"
        dest=(2 3 4)
        ping_to "${dest[@]}"
        ;;
    "2")
        configure_eth "${hosts[2]}"
        add_route_to "${hosts[3]}"
        dest=(1 3 4)
        ping_to "${dest[@]}"
        ;;
    "3")
        configure_eth "${hosts[3]}"
        add_route_to "${hosts[4]}"
        dest=(1 2 4)
        ping_to "${dest[@]}"
        ;;
    "4")
        configure_eth "${hosts[4]}"
        dest=(1 2 3)
        ping_to "${dest[@]}"
        ;;
    *)
        echo "Некорректно задан номер хоста"
        ;;
esac