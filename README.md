# 🏗️ Couleur Server Infrastruktur

Self-hosted infrastructure for solo entrepreneurs as alternative to US cloud services.

## 🎯 Goals
- ✅ Data Sovereignty (EU servers, own control)
- ✅ Independence (no vendor lock-ins, Open Source)
- ✅ Reproducibility (Infrastructure-as-Code)
- ✅ Modularity (scalable template for clients)

## 📦 Stack
- **Traefik** - Reverse Proxy + Auto-SSL
- **PostgreSQL** - Database
- **Redis** - Cache & Session Storage
- **N8N** - Workflow Automation
- **Ollama** - Local LLM (Llama3)
- **QDrant** - Vector Database
- **Nextcloud** - File Sync & Collaboration
- **OpenProject** - Project Management

## 🚀 Quick Start
```bash
# 1. Setup GitHub SSH
./scripts/setup-github.sh

# 2. Deploy infrastructure
./scripts/deploy.sh
```

See [docs/SETUP.md](docs/SETUP.md) for detailed instructions.

## 📁 Structure
```
├── scripts/          # Automation scripts
├── configs/          # Service configurations
├── docs/            # Documentation
├── docker-compose.yml
└── .env.example
```

## 🔒 Security
- UFW Firewall
- Fail2ban
- SSH Hardening
- Traefik Rate Limiting
- Automated Backups

## 💰 Cost
~€57/month (Hetzner CPX41 + 200GB + 5TB Storage Box)

## 📝 License
Private - Not for redistribution

---

**Status:** 🚧 Under Construction
**Version:** 2.0 (Clean Rebuild)
**Last Updated:** February 2026
