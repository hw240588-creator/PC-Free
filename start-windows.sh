#!/bin/bash
# start-windows.sh - Ein-Klick-Start für Windows 10 im Codespace
# Ausführen im Codespace-Terminal: bash start-windows.sh

set -euo pipefail

echo "=== PC-Free Windows 10 Start ==="
cd /workspaces/PC-Free

# 1. Alten Container & Volume sauber entfernen
echo "[1/5] Alten Container entfernen..."
docker stop windows 2>/dev/null || true
docker rm windows 2>/dev/null || true
docker volume rm pc-free_windows-data 2>/dev/null || true

# 2. Data-Verzeichnis anlegen
echo "[2/5] Data-Verzeichnis anlegen..."
sudo mkdir -p /var/lib/docker-data

# 3. Neuestes Image pullen
echo "[3/5] Image aktualisieren..."
docker-compose -f windows10.yml pull

# 4. Starten
echo "[4/5] Container starten..."
docker-compose -f windows10.yml up -d

# 5. Status & Logs
echo "[5/5] Status prüfen..."
sleep 3
docker ps --filter name=windows --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "=== FERTIG ==="
echo "Windows 10 lädt jetzt (5-10 Min beim ersten Mal)."
echo "Logs verfolgen:  docker logs -f windows"
echo "Im Browser:      Port 8006 in Codespace 'Ports' Tab -> Public -> Globe-Icon"
echo ""
echo "Live-Logs jetzt anzeigen? (STRG+C zum Beenden)"
docker logs -f windows