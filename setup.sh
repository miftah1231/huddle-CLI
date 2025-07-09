#!/bin/bash

echo "🔧 Starting Huddle01 Auto Setup..."

# === Step 1: Install ffmpeg ===
echo "📦 Installing ffmpeg..."
sudo apt update && sudo apt install -y ffmpeg

# === Step 2: Open Ports via UFW ===
echo "🔓 Configuring UFW Firewall..."

# Enable UFW if not active
sudo ufw enable

# Allow SSH (avoid being locked out)
sudo ufw allow ssh

# Static ports
sudo ufw allow 14000:14002/tcp
sudo ufw allow 14003:14004/tcp
sudo ufw allow 14003:14004/udp

# Get CPU core count
CORE_COUNT=$(nproc)
PORT_LIMIT=$((14100 + 2 * CORE_COUNT))

echo "💡 Detected $CORE_COUNT cores, opening ports 14100 to $PORT_LIMIT"

sudo ufw allow 14100:${PORT_LIMIT}/tcp
sudo ufw allow 14100:${PORT_LIMIT}/udp

# Show status
sudo ufw status numbered

# Show ffmpeg version
echo "✅ ffmpeg version:"
ffmpeg -version | head -n 1

echo "🎉 Setup complete. You can now install the Huddle01 Media Node CLI."
