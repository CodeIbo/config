# 🧪 Windows Setup – Config Toolkit

This folder contains scripts for setting up a new Windows development machine using [Chocolatey](https://chocolatey.org/) and additional helper tools.

These scripts are designed to automate:

- Installing core developer tools
- Configuring terminal and shell helpers
- Ensuring reproducible setup across machines

---

## 🧱 Prerequisites

- Windows 10 or 11
- PowerShell (Admin rights for installation)

---

## 📦 Chocolatey Installation

Run the script to install Chocolatey (if not already installed):

```powershell
./install-choco.ps1
```

This script will download Chocolatey securely and set up the necessary environment for package installs.

## 🔧 Install All Tools (Essentials)

```powershell
./choco-packages.ps1
```

- WezTerm – terminal emulator
- Git – version control
- Curl – command-line HTTP client
- Node.js – runtime for JavaScript
- Python – scripting & automation
- 7-Zip – archiving tool
- VLC – media player
- yt-dlp – YouTube downloader
- VSCodium – open-source Visual Studio Code
- Flow Launcher – application launcher / spotlight alternative
- Everything – instant file search for Windows

## 📥 YouTube Downloader Shortcut

Use the yt.bat script to:

- Download videos using yt-dlp
- Save them to a persistent folder you set once
- Automatically open the folder after download

### 🪟 Windows Custom CLI Commands

To make `yt.bat` globally accessible via a `yt` shortcut:

1. Create a folder such as: `C:\windows-customization`

2. Paste `yt.bat` inside `C:\windows-customization\yt.bat` (name of script will be your trigger keyword)

3. Press `Win + R` and run:

4. Click **Environment Variables**.

5. Under **User Variables**, find and edit the `Path` variable.

6. Click **New** and paste the folder `C:\windows-customization`

7. Click OK, then restart your terminal or PowerShell session.

Now you can simply type:

```cmd
yt <url> -f mp4
```

## 💡 Notes

- Don't forget config **Everything** with **Flow Launcher**

- You can add more shortcuts like ff, nv, cfg, etc., using the same approach.

