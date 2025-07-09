# 🚀 Huddle01 Media Node Setup Guide

> 🛠️ *Unofficial community-written guide for setting up a Huddle01 Media Node using their official script.*

---

## ⚙️ Recommended System Requirements

Choose a server or VPS that meets or exceeds the following specs:

| Specs                  | Max Supported Node Keys |
|------------------------|--------------------------|
| **4 vCPU / 250 Mbps**  | Up to 10 keys            |
| **8 vCPU / 1 Gbps**    | Up to 40 keys            |

---

## ⚡ Quick Auto-Install (One-Line Setup)

Run the command below to auto-install everything (including ffmpeg and firewall rules):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/miftah1231/huddle-CLI/main/setup.sh)
```

Check UFW status:
```bash
sudo ufw status numbered
```

Check ffmpeg version:
```bash
ffmpeg -version
```

This script will:
- Install `ffmpeg`
- Open all necessary ports based on detected core count
- Print `ffmpeg` version and firewall status

> ✅ You can still inspect the changes manually (see below for details).

---

## 🧭 Step-by-Step Installation (Manual)

### 1. Install Huddle01 Media Node CLI

```bash
curl -fsSL https://huddle01.network/api/install.sh | bash
```

### 2. Check CLI Version

```bash
hudl --version
```

### 3. Configure a Burner Wallet

> ⚠️ **Do not use your main wallet.**

```bash
hudl wallet configure
```

### 4. Start the Node in the Background

```bash
hudl node start -d
```

---

## 🌐 Required Ports (Manual Firewall Configuration)

If you're not using the auto-install script, open the following ports manually:

- **TCP:** 14000, 14001, 14002  
- **TCP + UDP:** 14003, 14004  
- **Dynamic (based on core count):**  
  From `14100` to `14100 + (2 × number of cores)`

**Example for 4 cores:**
```bash
sudo ufw allow 14100:14108/tcp
sudo ufw allow 14100:14108/udp
```

**Example for 8 cores:**
```bash
sudo ufw allow 14100:14116/tcp
sudo ufw allow 14100:14116/udp
```

Check UFW status:
```bash
sudo ufw status numbered
```

> 📌 Adjust port ranges to match your actual core count.

---

## 🧰 Optional: Manual ffmpeg Installation

```bash
sudo apt update
sudo apt install ffmpeg -y
```

To verify installation:
```bash
ffmpeg -version
```

---

## 📎 Official Guide

- https://www.huddle01.network/guides/How-to-run-a-Media-Node-via-CLI

---

> ℹ️ *This guide is maintained by the community and based on Huddle01's official installation script.*
