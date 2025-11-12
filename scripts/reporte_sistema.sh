#!/usr/bin/env bash
echo "======== REPORTE DEL SISTEMA ========"
echo "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')" # Muestra la fecha y hora en formato YYYY-MM-DD HH:MM:SS
echo "Host: $(hostname)"
echo "Usuarios conectados: $(who | wc -l)" # 'who' lista usuarios y 'wc -l' cuenta el número de líneas
echo ""

echo "Espacio libre en disco:"
# df -h muestra el espacio en formato legible. awk filtra la segunda línea (datos de la raíz /)
# y extrae el espacio libre ($4), total ($2) y porcentaje usado ($5).
df -h / | awk 'NR==2 {print "  " $4 " libres de " $2 " (" $5 " usado)"}' 
echo ""

echo "Memoria RAM disponible:"
# free -h muestra la memoria en formato legible. awk filtra la segunda línea (Total/Used/Free)
# e imprime el espacio disponible ($4) y el total ($2).
free -h | awk 'NR==2 {print "  " $4 " libres de " $2}' 
echo ""

# Verifica si el comando 'docker' está disponible en el sistema.
if command -v docker >/dev/null 2>&1; then 
  # Si Docker está disponible, cuenta el número de contenedores en ejecución (-q)
  echo "Contenedores Docker: $(docker ps -q 2>/dev/null | wc -l)" 
else
  echo "Docker no disponible"
fi
echo "====================================="
