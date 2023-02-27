# Overview

This repo contains a set of dotfiles and profile configs.

## Shell

### Post Installation TODO

- [ ] Change anaconda path.
- [ ] Add keychain key loading.
- [ ] Move neovim config to `~/.config/nvim/`
- [ ] Modify `~/.ssh/config`:
- [ ] `defaults write com.apple.Dock autohide-delay -float 0.0; killall Dock`
- [ ] `defaults write com.apple.dock autohide-time-modifier -float 0.5; killall Dock`
- [ ] `defaults write -g NSWindowShouldDragOnGesture -bool true`
- [ ] `defaults write - InitialkeyRepeat -int 13`
- [ ] `defaults write -g KeyRepeat -int 1`
- [ ] Change screenshot save folder.

```
IdentityFile ~/.ssh/X
IdentityFile ~/.ssh/Y

Host *
        AddKeysToAgent yes
        UseKeychain yes
        IdentitiesOnly yes
        PasswordAuthentication no
        VisualHostKey yes
        ServerAliveInterval 240

Host X X.com
        HostName X.com
        IdentityFile ~/.ssh/X

Host Y.com
        HostName Y.com
        IdentityFile ~/.ssh/Y
```

## Code

One file for custom keybindings and one with user settings.

### Extensions

- autoDocstring - Python Docstring Generator
- C/C++ by Microsoft
- Better Comments
- GitHub Theme
- GitLens
- Jupyter by Microsoft
- LaTeX Workshop by James Yu
- Python by Microsoft
- Python Indent
- Pylance
- Remote Development
- Vetur (for Vue)
- vscode-icons

## Apps

### Homebrew

See `Brewfile`. Install everything with `brew bundle --file=~/dotfiles/Brewfile`.

Apps not included in the `Brewfile`.

### App Store

- Magnet
- Notability
- pass. man.
- SnippetsLab
- Telegram
- Things 3
- Xcode

### Other

- [Affinity Photo](https://affinity.serif.com/en-us/photo/)
- [Capture One](https://www.captureone.com/en)
- [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve/)
- [Sketch](https://www.sketch.com)

- [Logitech Options](https://support.logi.com/hc/en-us/articles/360024361233)
