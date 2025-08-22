# Overview

This repo contains a set of dotfiles and profile configs.

## Install

### Auto

See `Brewfile`. Install everything with `brew bundle install`.

### Env & settings

1. Change the shell to fish:
    - modify `/etc/shells` and point to the fish installation
    - `chsh -s /path/to/fish`
2. Modify ssh config
    - add `~/.ssh/allowedSigners`
3. Add keychain key loading
4. Instant dock animation.
5. Change minimise animation.
6. Disable `Ctrl+Space`.
7. Don't rearrange spaces.
```sh
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.Dock autohide-delay -float 0.0
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock mru-spaces -bool false
killall Dock
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "<dict><key>enabled</key><false/></dict>"
```

8. Change screenshot save folder
9. Install manual stuff:
- Pragmata
- [Capture One](https://www.captureone.com/en)
- [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve/)
- [Logitech Options](https://support.logi.com/hc/en-us/articles/360024361233) and Logi+
- password manager
- [Rust & Stuff](https://www.rust-lang.org/tools/install)

### Dev

1. Install python and make sure that the correct version is exported
2. create `$HOME/.env.fish` and export w/e you need
3. Symlink configs if they don't require changes:
    - `.gitconfig.`
    - run `stow stow` in `$DOTFILES`
4. Set key repeat settings:
```sh
defaults write - InitialkeyRepeat -int 13
defaults write -g KeyRepeat -int 1
defaults write -g NSWindowShouldDragOnGesture -bool true
```

- Link vscode settings if using on that machine:
```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
ln -s $DOTFILES/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

Remember to install **neovim grammars**.
