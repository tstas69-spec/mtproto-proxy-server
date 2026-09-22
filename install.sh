#!/bin/bash
# ============================================================
# MTProto Server — One-Command Installer
# Full guide: https://tstas69-spec.github.io/
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   🚀 MTProto Server — One-Command Installer          ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════╝${NC}"

if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}❌ This script must be run as root. Use: sudo bash -c \"\$(curl -fsSL ...)\"${NC}"
    exit 1
fi

if ! grep -q "Ubuntu" /etc/os-release; then
    echo -e "${YELLOW}⚠️  Optimized for Ubuntu. Continuing anyway...${NC}"
    sleep 2
fi

echo -e "${GREEN}✅ System check passed.${NC}"

echo -e "${YELLOW}📦 Updating system packages...${NC}"
export DEBIAN_FRONTEND=noninteractive
apt update && apt -o Dpkg::Options::="--force-confold" upgrade -y

echo -e "${YELLOW}🐳 Installing Docker and firewall...${NC}"
apt install docker.io ufw curl -y

echo -e "${YELLOW}🔒 Configuring firewall...${NC}"
ufw allow OpenSSH
ufw allow 443/tcp
ufw --force enable

echo -e "${YELLOW}🧹 Checking for existing MTProto container...${NC}"
if [ "$(docker ps -aq -f name=^mtg$)" ]; then
    echo -e "${YELLOW}   Found existing container 'mtg' — removing before reinstall...${NC}"
    docker rm -f mtg >/dev/null 2>&1 || true
fi

echo -e "${YELLOW}🔑 Generating secret and starting MTProto container...${NC}"
SECRET=$(docker run --rm nineseconds/mtg:2 generate-secret --hex google.com)
docker run -d --name mtg --restart=always -p 443:443 nineseconds/mtg:2 simple-run -n 1.1.1.1 -i prefer-ipv4 0.0.0.0:443 "$SECRET"

SERVER_IP=$(curl -s ifconfig.me)

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   ✅ INSTALLATION COMPLETE!                          ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}🔗 YOUR TELEGRAM PROXY LINK:${NC}"
echo -e "${YELLOW}tg://proxy?server=$SERVER_IP&port=443&secret=$SECRET${NC}"
echo ""
echo -e "${GREEN}📋 Copy this link and paste it in Telegram:${NC}"
echo -e "   Settings → Data and Storage → Proxy Settings"
echo ""
echo -e "${CYAN}📖 FULL GUIDE WITH SCREENSHOTS:${NC}"
echo -e "${YELLOW}   https://tstas69-spec.github.io/${NC}"
echo ""
echo -e "${YELLOW}💡 To stop the proxy: docker stop mtg${NC}"
echo -e "${YELLOW}💡 To remove it: docker rm -f mtg${NC}"
