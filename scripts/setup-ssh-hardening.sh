#!/bin/bash
set -e

echo "=================================="
echo "🔐 SSH Hardening"
echo "=================================="
echo ""

# Backup erstellen
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Sichere SSH-Config
echo "📝 Konfiguriere SSH..."
cat >> /etc/ssh/sshd_config << 'SSH_EOF'

# Security Hardening
PermitRootLogin prohibit-password
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding no
PrintMotd no
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
SSH_EOF

# SSH neustarten
systemctl restart sshd

echo ""
echo "✅ SSH Hardening abgeschlossen!"
echo ""
echo "⚠️  WICHTIG:"
echo "- Root-Login nur mit SSH-Key"
echo "- Passwort-Auth deaktiviert"
echo "- Stelle sicher, dass dein SSH-Key funktioniert!"
