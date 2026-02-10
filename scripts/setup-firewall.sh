#!/bin/bash
set -e

echo "=================================="
echo "🔥 UFW Firewall Setup"
echo "=================================="
echo ""

# UFW installieren (falls nicht vorhanden)
if ! command -v ufw &> /dev/null; then
    echo "📦 Installiere UFW..."
    apt update -qq
    apt install -y ufw
fi

# Default Rules
echo "📝 Setze Default Rules..."
ufw default deny incoming
ufw default allow outgoing

# SSH erlauben (WICHTIG!)
echo "🔓 Erlaube SSH (Port 22)..."
ufw allow 22/tcp comment 'SSH'

# HTTP/HTTPS für Traefik
echo "🔓 Erlaube HTTP/HTTPS..."
ufw allow 80/tcp comment 'HTTP'
ufw allow 443/tcp comment 'HTTPS'

# Firewall aktivieren
echo "✅ Aktiviere Firewall..."
ufw --force enable

# Status anzeigen
echo ""
echo "=================================="
echo "🔥 Firewall Status:"
echo "=================================="
ufw status verbose

echo ""
echo "✅ Firewall Setup abgeschlossen!"
