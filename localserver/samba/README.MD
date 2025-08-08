# 📧 Samba Setup on Ubuntu (LAN only)

## 🔹 1. Install Samba

```bash
sudo apt install samba
```

## 🔹 2. Create a share folder

Preferably under root (e.g. `/shared`):

```bash
sudo mkdir /shared
```

## 🔹 3. Grant ownership

```bash
sudo chown $USER: /shared
```

## 🔹 4. Edit Samba configuration

Open the file:

```bash
sudo nvim /etc/samba/smb.conf
```

### Config changes:

- Find and update this line:

```
map to guest = never
```

- Add at the end of the file:

```ini
[shared]
   path = /shared
   writeable = yes
   public = no
```

## 🔹 5. Block external access

```bash
sudo ufw deny Samba
sudo ufw delete allow Samba
```

## 🔹 6. Allow Samba only from LAN

```bash
sudo ufw allow from 192.168.0.0/24 to any app Samba
```

## 🔹 7. Add Samba user

```bash
sudo smbpasswd -a <your_login>
```

Set a password – you’ll use it for logging in from Windows.

## 🔹 8. Restart Samba service

```bash
sudo systemctl restart smbd
```

## 🔹 9. Check local IP address

```bash
hostname -I
```

## 🔹 10. Connect from Windows

1. Open **"This PC" → "Map network drive"**
2. Enter:

```
\\<local_ip>\shared
```

3. Log in using the credentials from step 7.

