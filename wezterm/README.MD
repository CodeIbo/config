# 💻 WezTerm – Custom Terminal Setup (Windows)

This folder contains a streamlined `wezterm.lua` configuration designed for focused, keyboard-driven workflows in a visually clean and high-contrast environment.

> 🎨 Inspired by [vimichael/make-windows-pretty](https://github.com/vimichael/make-windows-pretty)

---

## 🎯 Features

- 📋 `Ctrl+V` → paste from clipboard
- 🪟 `Ctrl+Shift + H/J/K/L` → split panes in any direction
- 🧭 `Ctrl+Shift + Arrow Keys` → move between panes
- 🔁 `Ctrl+Shift+R` → reload configuration instantly
- ❌ `Ctrl+Shift+X` → close current pane
- 🔍 `Ctrl+X` → activate copy mode
- ⬆️ `Ctrl+Alt + Up/Down` → scroll by line

---

## 🎨 Appearance

- **Font**: IBM Plex Mono, 18pt
- **Color Scheme**: `Windows High Contrast (base16)`
- **Cursor**: Blinking Block
- **Tab Bar**: Hidden if only one tab
- **Opacity**: 85%
- **Decorations**: No top bar, resizable window
- **Startup Shell**: PowerShell

---

## 🗂️ File Included

- [`wezterm.lua`](wezterm.lua) — full working configuration

---

## 🪟 Windows Installation

1. Navigate to:

   `C:\Users<YourUsername>\AppData\Local\wezterm\`

2. Place the `wezterm.lua` file inside that folder.

3. Restart WezTerm or press `Ctrl+Shift+R` to reload the configuration.
