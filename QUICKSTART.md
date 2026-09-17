# PC-Free Windows 10 - Schnellstart (Codespace)

## Dateien (fertig in diesem Repo)
- `windows10.yml` - Docker Compose Config (mit DNS, 6GB RAM, 2 CPU)
- `.env` - Credentials (admin / SecurePass123!)
- `start-windows.sh` - Ein-Klick-Start-Skript

---

## Im Codespace ausführen (ein Befehl)

```bash
bash start-windows.sh
```

Das war's. Skript macht alles:
1. Alten Container löschen
2. Data-Verzeichnis anlegen
3. Neuestes Image laden
4. Container starten
5. Live-Logs anzeigen

---

## Was passiert dann

| Phase | Dauer | Was du siehst |
|-------|-------|---------------|
| **Download Windows 10** | 5–10 Min | `Downloading Windows 10... 45%` |
| **Installation** | 2–3 Min | `Installing Windows...` |
| **Boot / Desktop** | 1–2 Min | noVNC Login-Screen |

**Nicht abbrechen!** Erster Start lädt ~4 GB.

---

## Im Browser öffnen

1. Codespace → **Ports** Tab
2. Port **8006** → Visibility: **Public**
3. **Globe-Icon** anklicken → Windows 10 Desktop

Login: `admin` / `SecurePass123!`

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| "Could not resolve host" | Skript setzt DNS (8.8.8.8, 1.1.1.1) – sollte weg sein |
| "CPU_CORES exceeds" | Skript nutzt 2 Cores (Codespace hat 2 vCPUs) |
| "No space left" | `docker system prune -af --volumes` im Terminal |
| Schwarzer Bildschirm | 2–3 Min warten, Browser refreshen, `docker restart windows` |
| Port 8006 nicht erreichbar | Ports Tab → 8006 Public machen |

---

## Nützliche Befehle

```bash
# Logs live
docker logs -f windows

# Container neu starten
docker restart windows

# Status
docker ps --filter name=windows

# Komplett zurücksetzen
docker-compose -f windows10.yml down -v
bash start-windows.sh
```

---

## Credentials ändern

`.env` bearbeiten → `bash start-windows.sh` erneut ausführen.