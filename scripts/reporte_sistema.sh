#!/usr/bin/env bash
echo "======== REPORTE DEL SISTEMA ========"
echo "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Host: $(hostname)"
echo "Usuarios conectados: $(who | wc -l)"
echo ""
echo "Espacio libre en disco:"
df -h / | awk 'NR==2 {print "  " $4 " libres de " $2 " (" $5 " usado)"}'
echo ""
echo "Memoria RAM disponible:"
free -h | awk 'NR==2 {print "  " $4 " libres de " $2}'
echo ""
if command -v docker >/dev/null 2>&1; then
  echo "Contenedores Docker: $(docker ps -q 2>/dev/null | wc -l)"
else
  echo "Docker no disponible"
fi
echo "====================================="
