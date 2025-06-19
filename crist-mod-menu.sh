#!/data/data/com.termux/files/usr/bin/bash

# ───── Instalación automática ─────
pkg update -y &> /dev/null
pkg install termux-api -y &> /dev/null

# ───── Mostrar TikTok (una sola vez) ─────
if [ ! -f ~/.crist_mod_installed ]; then
  termux-open-url "https://www.tiktok.com/@crist.1.0?_t=ZN-8xKx4vMdkec&_r=1"
  echo "✅ Gracias por instalar Crist MOD Menu."
  echo "📲 Sígueme en TikTok: @crist.1.0"
  touch ~/.crist_mod_installed
  sleep 3
fi

# ───── Comando global ─────
ln -sf "$(realpath $0)" /data/data/com.termux/files/usr/bin/crist-mod

# ───── Colores ─────
verde="\e[32m"; rojo="\e[31m"; amarillo="\e[33m"; azul="\e[34m"; reset="\e[0m"

# ───── Funciones ─────
cerrar_apps() {
  echo -e "${amarillo}🔧 Cerrando apps...${reset}"
  am kill-all &> /dev/null
  echo -e "${verde}✔ Listo.${reset}"
}

liberar_ram() {
  echo -e "${amarillo}🧠 Liberando RAM...${reset}"
  sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null
  echo -e "${verde}✔ Memoria optimizada.${reset}"
}

desactivar_animaciones() {
  echo -e "${amarillo}🚫 Desactivando animaciones...${reset}"
  settings put global window_animation_scale 0
  settings put global transition_animation_scale 0
  settings put global animator_duration_scale 0
  echo -e "${verde}✔ Animaciones desactivadas.${reset}"
}

modo_ahorro() {
  echo -e "${amarillo}📉 Activando ahorro de batería...${reset}"
  settings put system screen_brightness 20
  settings put system accelerometer_rotation 0
  svc wifi disable
  svc bluetooth disable
  echo -e "${verde}✔ Ahorro activado.${reset}"
}

restaurar() {
  echo -e "${amarillo}♻️ Restaurando configuración normal...${reset}"
  settings put global window_animation_scale 1
  settings put global transition_animation_scale 1
  settings put global animator_duration_scale 1
  settings put system screen_brightness 100
  settings put system accelerometer_rotation 1
  svc wifi enable
  echo -e "${verde}✔ Restaurado.${reset}"
}

ver_info() {
  echo -e "${amarillo}📊 Estado del sistema:${reset}"
  termux-info | grep "memory" || top -n 1 | head -n 5
}

modo_gamer() {
  cerrar_apps
  liberar_ram
  desactivar_animaciones
  modo_ahorro
  echo -e "${verde}✅ Modo Gamer activado.${reset}"
}

# ───── Menú ─────
while true; do
  clear
  echo -e "${verde}=============================="
  echo -e "     🎮 CRIST MOD MENU        "
  echo -e "==============================${reset}"
  echo -e "${azul}  Terminal Gamer Toolkit v1.0${reset}\n"

  echo -e "${amarillo}"
  echo "1) 🔧 Cerrar procesos"
  echo "2) 🧠 Liberar RAM"
  echo "3) 🚫 Desactivar animaciones"
  echo "4) 📉 Activar modo ahorro"
  echo "5) 📊 Ver info del sistema"
  echo "6) 💣 Modo Gamer Pro (todo)"
  echo "7) ♻️ Restaurar todo"
  echo "8) 🚪 Salir"
  echo -e "${reset}"
  read -p "👉 Opción: " op

  case $op in
    1) cerrar_apps ;;
    2) liberar_ram ;;
    3) desactivar_animaciones ;;
    4) modo_ahorro ;;
    5) ver_info ;;
    6) modo_gamer ;;
    7) restaurar ;;
    8) echo -e "${rojo}Saliendo...${reset}"; exit 0 ;;
    *) echo -e "${rojo}❌ Opción inválida.${reset}" ;;
  esac

  echo -ne "\n¿Volver al menú? (s/n): "
  read volver
  [[ "$volver" != "s" ]] && break
done
