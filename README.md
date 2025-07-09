
# 🚀 Huddle01 Media Node Setup Guide

This is an unofficial setup guide for running a Huddle01 Media Node using their official script.

---

## ⚙️ Recommended System Requirements

Choose based on your hardware:

- **4 vCPU / 250 Mbps** → supports up to 10 node keys  
- **8 vCPU / 1 Gbps** → supports up to 40 node keys

> Always use a VPS or server that meets or exceeds these requirements.

---

## 🌐 Required Open Ports

Huddle01 requires the following ports to be open on your firewall:

- **TCP:** 14000, 14001, 14002  
- **TCP + UDP:** 14003, 14004  
- **Dynamic Range (depends on CPU cores):**  
  Open ports from `14100` to `14100 + (2 × number of cores)`

### Example for 4 cores:
```bash
sudo ufw allow 14100:14108/tcp
sudo ufw allow 14100:14108/udp
```

### Example for 8 cores:
```bash
sudo ufw allow 14100:14116/tcp
sudo ufw allow 14100:14116/udp
```

> Adjust the port range based on your actual CPU core count.

---

## 🔐 Open Ports Using UFW (Ubuntu Firewall)

```bash
sudo ufw enable
sudo ufw allow ssh

# Open base TCP ports
sudo ufw allow 14000:14002/tcp

# Open TCP and UDP for additional ports
sudo ufw allow 14003:14004/tcp
sudo ufw allow 14003:14004/udp

# Open dynamic ports (adjust as needed based on CPU cores)
sudo ufw allow 14100:14116/tcp
sudo ufw allow 14100:14116/udp

# Check firewall status
sudo ufw status numbered
```

---

## 🧰 Installation Steps

### 1. Install ffmpeg
```bash
sudo apt update
sudo apt install ffmpeg -y
```

### 2. Verify ffmpeg installation
```bash
ffmpeg -version
```

### 3. Install Huddle01 Media Node CLI
```bash
curl -fsSL https://huddle01.network/api/install.sh | bash
```

### 4. Verify CLI installation
```bash
hudl --version
```

### 5. Configure your burner wallet (DO NOT use your main wallet)
```bash
hudl wallet configure
```

### 6. Start the node in the background
```bash
hudl node start -d
```

---

## 📎 Official Resources

- Website: [https://huddle01.com](https://huddle01.com)  
- Installer Script: [https://huddle01.network/api/install.sh](https://huddle01.network/api/install.sh)

---

> 📌 This guide is community-written and based on the official installation script.
