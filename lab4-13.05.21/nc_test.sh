modes=("CLIENT" "SERVER")
case ${1} in
    "${modes[0]}")
        nc 7.8.3.2 8090 << EOF
Artemy Kulbako
EOF
        ;;
    "${modes[1]}")
        nc -l 8090
        ;;
    *)
      echo "Режим задан некорректно"
esac