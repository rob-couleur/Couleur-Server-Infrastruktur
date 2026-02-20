#!/bin/bash
set -e

echo "=========================================="
echo "🔒 SECURITY SETUP - ALL IN ONE"
echo "=========================================="
echo ""
echo "Installiert & konfiguriert:"
echo "  1. UFW Firewall"
echo "  2. Fail2ban"
echo "  3. SSH Hardening (optional)"
echo ""
read -p "Fortfahren? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Abgebrochen"
    exit 1
fi

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
echo "=========================================="
echo "PHASE 1: UFW FIREWALL"
echo "=========================================="
bash "$SCRIPT_DIR/setup-firewall.sh"

echo ""
echo "=========================================="
echo "PHASE 2: FAIL2BAN"
echo "=========================================="
bash "$SCRIPT_DIR/setup-fail2ban.sh"

echo ""
echo "=========================================="
echo "PHASE 3: SSH HARDENING"
echo "=========================================="
echo ""
echo "⚠️  SSH Hardening deaktiviert Passwort-Login!"
echo "⚠️  Danach nur noch SSH-Key möglich!"
echo ""
read -p "SSH Hardening JETZT ausführen? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bash "$SCRIPT_DIR/setup-ssh-hardening.sh"
    echo ""
    echo "✅ SSH Hardening aktiviert!"
else
    echo "⏭️  SSH Hardening übersprungen"
    echo "   Später ausführen mit: ./scripts/setup-ssh-hardening.sh"
fi

echo ""
echo "=========================================="
echo "✅ SECURITY SETUP ABGESCHLOSSEN!"
echo "=========================================="
echo ""
echo "Status:"
echo "  ✅ UFW Firewall: Aktiv"
echo "  ✅ Fail2ban: Aktiv"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "  ✅ SSH Hardening: Aktiviert"
else
    echo "  ⏭️  SSH Hardening: Übersprungen"
fi
echo ""
echo "Prüfen mit:"
echo "  sudo ufw status"
echo "  sudo fail2ban-client status"
