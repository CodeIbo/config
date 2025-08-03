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

### Tips

- Use one .conf file per domain for easier management.

- Keep content like index.html, style.css, etc., directly in the html/ folder.

- You can host static sites, or combine this setup with a reverse proxy for dynamic apps.

- `hostname -I` for local ip address
