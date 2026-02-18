# Security Setup

## 🚀 Quick Start (Alles auf einmal)
```bash
./scripts/setup-security-all.sh
```

Installiert nacheinander:
1. UFW Firewall
2. Fail2ban
3. SSH Hardening (mit Bestätigung)

---

## 🔧 Einzeln ausführen

### 1. UFW Firewall
```bash
./scripts/setup-firewall.sh
```
**Was es macht:**
- Blockiert alle eingehenden Verbindungen (Default Deny)
- Erlaubt SSH (Port 22)
- Erlaubt HTTP (Port 80)
- Erlaubt HTTPS (Port 443)

### 2. Fail2ban
```bash
./scripts/setup-fail2ban.sh
```
**Was es macht:**
- Blockiert IPs nach 5 fehlgeschlagenen SSH-Login-Versuchen
- Ban-Zeit: 1 Stunde
- Monitoring-Zeitraum: 10 Minuten

### 3. SSH Hardening
```bash
./scripts/setup-ssh-hardening.sh
```
**Was es macht:**
- Deaktiviert Passwort-Login
- Nur SSH-Key-Authentication
- Root-Login nur mit Key

⚠️ **WICHTIG:** Erst ausführen wenn SSH-Key 100% funktioniert!

---

## 📊 Status prüfen
```bash
# Firewall
sudo ufw status verbose

# Fail2ban
sudo fail2ban-client status
sudo fail2ban-client status sshd

# SSH-Config
sudo sshd -T | grep -E "PermitRootLogin|PasswordAuthentication"
```

---

## 🔄 Für neue Server

Auf neuem Server:
```bash
git clone git@github.com:rob-couleur/Couleur-Server-Infrastruktur.git
cd Couleur-Server-Infrastruktur
./scripts/setup-security-all.sh
```

Fertig in 2 Minuten! ✅
