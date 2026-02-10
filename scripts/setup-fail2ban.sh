#!/bin/bash
set -e

echo "=================================="
echo "🛡️  Fail2ban Setup"
echo "=================================="
echo ""

# Installieren
echo "📦 Installiere Fail2ban..."
apt update -qq
apt install -y fail2ban

# Config erstellen
echo "📝 Erstelle Config..."
cat > /etc/fail2ban/jail.local << 'JAIL_EOF'
[DEFAULT]
bantime = 10m
findtime = 10m
maxretry = 5
destemail = rob@couleur.agency
sendername = Fail2ban

[sshd]
enabled = true
port = 22
logpath = /var/log/auth.log
maxretry = 5
bantime = 1h
JAIL_EOF

# Service starten
systemctl enable fail2ban
systemctl restart fail2ban

# Status
echo ""
echo "=================================="
echo "🛡️  Fail2ban Status:"
echo "=================================="
fail2ban-client status

echo ""
echo "✅ Fail2ban Setup abgeschlossen!"
