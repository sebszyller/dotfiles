# Overview

This repo contains a set of dotfiles and profile configs.

## Shell

### Post Installation TODO

- System
    - `defaults write com.apple.dock autohide-time-modifier -float 0.5; killall Dock`
    - `defaults write com.apple.Dock autohide-delay -float 0.0; killall Dock`
    - Add keychain key loading
    - Modify ssh config
    - Change the shell to fish:
        - modify `/etc/shells` and point to the fish installation
        - `chsh -s /path/to/fish`
        - symlink `~/.config/fish`
    - Change screenshot save folder.
    - Patch the dev font with [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- Dev
    - Change anaconda path.
    - `defaults write -g NSWindowShouldDragOnGesture -bool true`
    - `defaults write - InitialkeyRepeat -int 13`
    - `defaults write -g KeyRepeat -int 1`
    - `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
    - Symlink configs if they don't require changes:
        - `.gitconfig.`
        - neovim config to `~/.config/nvim/`
        - tmux config to `~/.config/tmux/` or `~/.tmux.conf` on Linux
    - Link vscode settings to `dotfiles`:
        - `ln -s $DOTFILES/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json`
        - `ln -s $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json`

### NeoVim

It should install all plugins automatically if the config is symlinked properly.

## Apps

### Homebrew

See `Brewfile`. Install everything with `brew bundle --file=~/dotfiles/Brewfile`.

Apps not included in the `Brewfile`.

### App Store

- pass. man.
- SnippetsLab
- Telegram
- Things 3
- Xcode

### Other

- [Capture One](https://www.captureone.com/en)
- [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve/)
- [Logitech Options](https://support.logi.com/hc/en-us/articles/360024361233) and Logi+
<!-- - [Poetry](https://python-poetry.org/docs/) -->
- [Rust & Stuff](https://www.rust-lang.org/tools/install)
