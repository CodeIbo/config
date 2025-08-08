# 🌐 Nginx – Local Development Site Hosting ( LINUX )

This folder contains Nginx configuration templates for hosting multiple local domains such as: `<name>.local`.

These are meant for local development or LAN-only access - no internet exposure.

## Folder Structure Example

Each domain has its own root folder, e.g.:

`/srv/www/<name>.local/html/index.html`

## Setup Steps

1. **Create the domain root folder:**

   ```bash
   sudo mkdir -p /srv/www/<name>.local/html
   sudo <editor> /srv/www/<name>.local/html/index.html
   ```

2. **Copy and customize a config file:**
   Use the [example.conf](example.conf) as starting point in. Copy it into your system's Nginx config directory:
   `/etc/nginx/sites-available` && `/etc/nginx/sites-enabled`. Then, edit the file placeholders `<name>`.

3. **Update** `/etc/hosts`

```hosts
  127.0.0.1 <name>.local
```

4. **Reload nginx:**

```bash
 sudo nginx -t
 sudo systemctl reload nginx
```

If confing is correct you should see in :

```bash
service nginx status
```

`Active: active (running)`

### Apache conflict

Turn off apache

```bash
systemctl stop apache2
systemctl disable apache2
```

If you still see apache home page check [this](https://askubuntu.com/questions/642238/why-do-i-still-see-an-apache-site-on-nginx) solution:

```bash
mv /var/www/html/index.html index.html_bkp
```

### Tips

- Use one .conf file per domain for easier management.

- Keep content like index.html, style.css, etc., directly in the html/ folder.

- You can host static sites, or combine this setup with a reverse proxy for dynamic apps.

- `hostname -I` for local ip address

- Missing nginx config file [link](https://yottasrc.com/billing/knowledgebase/144/Nginx-Configuration-File-Missing-Fix-the-issue.html)

### ⛨️ Local network restriction (security)

To restrict access to your Nginx site only from the local network, edit your domain's config file (e.g. `/etc/nginx/sites-available/<name>.local`) and add inside the `server {}` block:

```nginx
allow 192.168.0.0/24;
deny all;
```

Then reload nginx:

```bash
sudo systemctl reload nginx
```

This ensures only devices in your LAN (e.g. 192.168.0.x) can access the site. Everything else will get 403 Forbidden.

### 🔒 Firewall restriction using UFW (optional)

You can also restrict Nginx access to local network at the firewall level:

```bash
sudo ufw delete allow "Nginx Full"
sudo ufw allow from 192.168.0.0/24 to any port 80 proto tcp
sudo ufw allow from 192.168.0.0/24 to any port 443 proto tcp
```

This ensures ports 80 and 443 are only reachable from the local network.
You can verify with:

```bash
sudo ufw status verbose
```

From outside the LAN, these ports will show as closed or filtered.

