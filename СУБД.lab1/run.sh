#!/usr/bin/env bash
set -euo pipefail
SQLFILE="${1:?Укажи .sql файл: ./run.sh sql/lab11.sql}"
REPORT="${2:-reports/$(basename "${SQLFILE%.sql}")_$(date +%Y%m%d_%H%M%S).txt}"
if [ ! -f "$SQLFILE" ]; then echo "Файл не найден: $SQLFILE" >&2; exit 1; fi
mkdir -p "$(dirname "$REPORT")"
echo "Выполняю: $SQLFILE"
echo "Отчёт:    $REPORT"
docker exec -i sqlserver /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P 'YourStrong!Passw0rd' -C -f 65001 \
  -i /dev/stdin < "$SQLFILE" > "$REPORT" 2>&1
echo "Готово. Открыть: open $REPORT"
