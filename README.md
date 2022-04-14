# Overview

This repo contains a set of dotfiles and profile configs.

## Shell

### Post Installation TODO

- Change anaconda path.
- Add keychain key loading.
- Move wezterm config to `~/.config/wezterm/`
- Modify `~/.ssh/config`:

```
IdentityFile ~/.ssh/X
IdentityFile ~/.ssh/Y
IdentityFile ~/.ssh/Z

Host *
        AddKeysToAgent yes
        UseKeychain yes
        IdentitiesOnly yes

Host X.com
        HostName X.com
        IdentityFile ~/.ssh/X

Host Y.com
        HostName Y.com
        IdentityFile ~/.ssh/Y

Host Z.com
        HostName Z.com
        IdentityFile ~/.ssh/Z
```

## Code

One file for custom keybindings and one with user settings.

### Extensions

- autoDocstring
- C/C++ by Microsoft
- Better Comments
- LaTeX Workshop by James Yu
- Python by Microsoft
- Python Docstring Generator
- Python Indent
- Pylance
- Remote Development
- vscode-icons

## Apps

### brew

- anaconda
- bat
- coreutils
- delta
- devtools
- docker
- fd
- ffmpeg
- fzf
- git
- glow
- jc
- jq
- htop
- httpie
- m-cli
- neofetch
- pandoc
- ripgrep
- sqlite
- tex-live
- tldr
- tree
- wget

### media

- Affinity Photo
- DaVinci Resolve
- Capture One
- OBS
- Sketch
- VLC and IINA

### dev

- ProxyMan
- SnippetsLab
- Vagrant
- VSCode
- WezTerm
- Xcode

### utils

- pass. man.
- Magnet
- Karabiner
- QMK
- Logitech Options

### productivity and comms

- Telegram
- Skype
- Office (with Teams)
- Things 3
- Obsidian.md

