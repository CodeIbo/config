# 🖥️ Shell Configuration

This folder contains shell-related configuration files and startup scripts used within terminal environments (like WezTerm, Windows Terminal, or WSL).

These configurations set up:

- Environment variables (like `$PATH`)
- Aliases and command helpers
- Startup behavior for PowerShell or Bash

## 🪟 Windows Shell (PowerShell)

Windows shell configuration is located under [Windows](./windows/Microsoft.PowerShell_profile.ps1).

To enable it:

1. Open PowerShell and check your profile location:

   ```powershell
   $PROFILE
   ```

2. Copy or symlink `powershell_profile.ps1` to that path.

## 🐧 Linux Shell (planned)

Coming soon: `.bashrc`, `.zshrc`, and shell exports for Linux-based setups.

