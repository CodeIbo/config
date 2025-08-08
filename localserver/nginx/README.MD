# 🛠️ Local Development Setup: Nginx + Python Backend

This guide covers how to set up a local development environment using Nginx for static hosting and a backend service. It currently focuses on Python (FastAPI), but support for additional backend technologies (e.g. Node.js, Go, PHP) will be added in the future. It also includes how to auto-start your backend service using `systemd`. Suitable for organizing under Obsidian vault.

---

## 🌐 Nginx Setup for Local Domain

### 1. **Create domain root folder**

```bash
sudo mkdir -p /srv/www/<name>.local/html
sudo <editor> /srv/www/<name>.local/html/index.html
```

### 2. **Copy and customize a config file**

Use an `example.conf` and place it into:

- `/etc/nginx/sites-available/<name>.local`
- Create a symlink:

```bash
sudo ln -s /etc/nginx/sites-available/<name>.local /etc/nginx/sites-enabled/
```

Update placeholders (`<name>`) accordingly.

### 3. **Update /etc/hosts**

```hosts
127.0.0.1 <name>.local
```

### 4. **Reload Nginx**

```bash
sudo nginx -t
sudo systemctl reload nginx
```

Verify:

```bash
sudo systemctl status nginx
```

You should see `Active: active (running)`.

### 🚨 Apache Conflict (if any)

```bash
sudo systemctl stop apache2
sudo systemctl disable apache2
```

If Apache default page still appears:

```bash
sudo mv /var/www/html/index.html /var/www/html/index.html_bkp
```

---

## 💡 Tips for Nginx

- Use one `.conf` file per domain.
- Keep static content (`index.html`, `style.css`, etc.) inside the `html/` folder.
- Can reverse proxy to a backend (e.g., Python API).
- Use `hostname -I` to get your local IP address.

### 🔐 Restrict Access to Local Network Only

In your site config:

```nginx
allow 192.168.0.0/24;
deny all;
```

Then reload:

```bash
sudo systemctl reload nginx
```

### 🔥 Restrict via UFW Firewall (optional)

```bash
sudo ufw delete allow "Nginx Full"
sudo ufw allow from 192.168.0.0/24 to any port 80 proto tcp
sudo ufw allow from 192.168.0.0/24 to any port 443 proto tcp
```

Check:

```bash
sudo ufw status verbose
```

---

## 🚀 Python Backend Setup (FastAPI Example)

### 📁 Directory Structure Recommendation:

Place backend inside:

```
/srv/www/<name>.local/backend/
```

### 🔧 Nginx Reverse Proxy to API

In your app's Nginx config (`/etc/nginx/sites-available/<name>.local`), add inside `server {}`:

```nginx
location /api/ {
    proxy_pass http://127.0.0.1:<number>/api/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
```

And copy this version of file to : `/etc/nginx/sites-enabled/<name>.local`

Now you can access the API via:

```
http://<name>.local/api/
```

To test backend directly:

```bash
curl http://127.0.0.1:<number>
```

### 🗪 Backend Environment Setup (venv)

> Always set up virtualenv without `sudo`

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

To test FastAPI app:

```bash
uvicorn <filename>:app --host 127.0.0.1 --port <any>
```

---

## 🔁 Auto-start Python Backend via systemd

Use an `example.service`, e.g. `/etc/systemd/system/<name>.service`:
Don't forget change values in `<this>`

### 🔄 Enable and start service:

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable <name>.service
sudo systemctl start <name>.service
sudo systemctl status <name>.service
```

---

## ✅ Summary

With this setup:

- Your static site is available at `http://<name>.local`
- Your API is available at `http://<name>.local/api/`
- The backend (currently Python) starts automatically with the system
- Access is optionally restricted to your local network only

Support for other backend languages and frameworks will be included in future versions of this setup guide.

