#!/bin/bash
set -e

echo "=================================="
echo "🔧 GitHub SSH Setup Script"
echo "=================================="
echo ""

# 1. Git Config
echo "📝 Git-Config setzen..."
git config --global user.name "Rob Couleur"
git config --global user.email "rob@couleur.agency"
echo "✅ Git-Config gesetzt"
echo ""

# 2. SSH-Key generieren
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "⚠️  SSH-Key existiert bereits!"
    read -p "Neu generieren? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "✅ Verwende existierenden Key"
    else
        rm -f ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
        ssh-keygen -t ed25519 -C "rob@couleur.agency" -f ~/.ssh/id_ed25519 -N ""
        echo "✅ Neuer SSH-Key generiert"
    fi
else
    ssh-keygen -t ed25519 -C "rob@couleur.agency" -f ~/.ssh/id_ed25519 -N ""
    echo "✅ SSH-Key generiert"
fi
echo ""

# 3. SSH-Config erstellen
echo "📝 SSH-Config erstellen..."
cat > ~/.ssh/config << 'EOF'
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config
echo "✅ SSH-Config erstellt"
echo ""

# 4. Public Key anzeigen
echo "=================================="
echo "🔑 DEIN PUBLIC KEY:"
echo "=================================="
cat ~/.ssh/id_ed25519.pub
echo ""
echo "=================================="
echo ""
echo "📋 NÄCHSTE SCHRITTE:"
echo ""
echo "1. Kopiere den Key oben (KOMPLETTE Zeile!)"
echo "2. Gehe zu: https://github.com/settings/keys"
echo "3. Klicke 'New SSH key'"
echo "4. Title: 'Hetzner Production Server'"
echo "5. Key: [PASTE]"
echo "6. Save"
echo ""
read -p "Key bei GitHub hinzugefügt? Drücke ENTER zum Testen..."

# 5. Verbindung testen
echo ""
echo "🧪 Teste GitHub-Verbindung..."
if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo "✅ GitHub-Verbindung erfolgreich!"
    echo ""
    echo "=================================="
    echo "✅ SETUP KOMPLETT!"
    echo "=================================="
else
    echo "❌ Verbindung fehlgeschlagen!"
    echo "Prüfe ob der Key bei GitHub korrekt eingefügt wurde."
    exit 1
fi
