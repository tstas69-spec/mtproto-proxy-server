#!/bin/bash
# ============================================================
# MTProto Server — Uninstaller
# Full guide: https://tstas69-spec.github.io/
# ============================================================

echo "🗑️  Removing MTProto proxy..."
docker stop mtg 2>/dev/null || true
docker rm mtg 2>/dev/null || true
echo "✅ Proxy removed. Container 'mtg' deleted."
echo "ℹ️  Note: firewall rule for port 443 (ufw) was left untouched — remove manually with 'ufw delete allow 443/tcp' if no longer needed."
echo "📖 Full guide: https://tstas69-spec.github.io/"
