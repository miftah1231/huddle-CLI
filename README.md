
# 🚀 Huddle01 Media Node Setup Guide

This is an unofficial setup guide for running a Huddle01 Media Node using their official script.

---

## ⚙️ Recommended System Requirements

Choose based on your hardware:

- **4 vCPU / 250 Mbps** → supports up to 10 node keys  
- **8 vCPU / 1 Gbps** → supports up to 40 node keys

> Always use a VPS or server that meets or exceeds these requirements.

---

## ⚡ Quick Auto-Install (1 Line Setup)

Run this command to install ffmpeg and open all required ports automatically (adjusted to your CPU cores):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/miftah1231/huddle-CLI/main/setup.sh)
```

This will:
- Install `ffmpeg`
- Open required UFW ports (based on detected core count)
- Print `ffmpeg` version and firewall status

> You can still verify or inspect everything manually if needed.

---

## 🌐 Required Open Ports (If Doing Manually)

Huddle01 requires the following ports to be open:

- **TCP:** 14000, 14001, 14002  
- **TCP + UDP:** 14003, 14004  
- **Dynamic Range (depends on CPU cores):**  
  Open ports from `14100` to `14100 + (2 × number of cores)`

Example for 4 cores:
```bash
sudo ufw allow 14100:14108/tcp
sudo ufw allow 14100:14108/udp
```

Example for 8 cores:
```bash
sudo ufw allow 14100:14116/tcp
sudo ufw allow 14100:14116/udp
```

> Adjust based on your actual CPU core count.

---

## 🧰 Manual Installation Steps

### 1. Install ffmpeg
```bash
sudo apt update
sudo apt install ffmpeg -y
```

### 2. (Optional) Verify ffmpeg
```bash
ffmpeg -version
```

### 3. Install Huddle01 Media Node CLI
```bash
curl -fsSL https://huddle01.network/api/install.sh | bash
```

### 4. Check CLI version
```bash
hudl --version
```

### 5. Configure a burner wallet (DO NOT use your main wallet)
```bash
hudl wallet configure
```

### 6. Start the node in background
```bash
hudl node start -d
```

---

## 📎 Official Resources

- Website: [https://huddle01.com](https://huddle01.com)  
- Installer Script: [https://huddle01.network/api/install.sh](https://huddle01.network/api/install.sh)

---

> 📌 This guide is community-written and based on the official installation script.
