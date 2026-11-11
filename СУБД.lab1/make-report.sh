#!/usr/bin/env bash
set -euo pipefail
SQLFILE="${1:?Укажи .sql файл}"
OUT="${3:-reports/$(basename "${SQLFILE%.sql}").md}"
RESULTFILE="${2:-}"
if [ -z "$RESULTFILE" ]; then
  RESULTFILE=$(ls -t reports/"$(basename "${SQLFILE%.sql}")"_*.txt 2>/dev/null | head -n1 || true)
fi
if [ ! -f "$SQLFILE" ]; then echo "Нет файла: $SQLFILE" >&2; exit 1; fi
if [ -z "$RESULTFILE" ] || [ ! -f "$RESULTFILE" ]; then
  echo "Не найден отчёт. Сначала: ./run.sh $SQLFILE" >&2
  exit 1
fi
mkdir -p "$(dirname "$OUT")"
{
  echo "# Отчёт: $(basename "$SQLFILE")"
  echo
  echo "_Дата: $(date '+%Y-%m-%d %H:%M')_"
  echo
  echo "## SQL-скрипт"
  echo
  echo '```sql'
  cat "$SQLFILE"
  echo '```'
  echo
  echo "## Результат выполнения"
  echo
  echo '```'
  cat "$RESULTFILE"
  echo '```'
} > "$OUT"
echo "Отчёт: $OUT"
echo "Открой в VS Code и нажми Cmd+Shift+V для превью"
