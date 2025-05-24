# Force locale
set -x LC_ALL en_GB.UTF-8
set -x LC_CTYPE en_GB.UTF-8

# Dotfiles
set -gx XDG_CONFIG_HOME ~/.config
set -gx DOTFILES ~/dotfiles
set -gx FISH $XDG_CONFIG_HOME/fish

# Env
source $HOME/.env.fish

# Dev-specific
set -gx PYTHON_INSTALLS /Library/Frameworks/Python.framework/Versions
set -gx PIP_REQUIRE_VIRTUALENV true
fish_add_path $PYTHON_INSTALLS/3.11/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin

# OS-specific
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
end

# Opts and flags
set -gx EDITOR nvim
set -gx SUDO_EDITOR $EDITOR
set -gx VISUAL $EDITOR

set -gx fish_greeting ""
set -gx LESS -rF
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx MANPAGER 'sh -c "col -bx | bat -l man --theme=\'Solarized (dark)\' -p"'

# Custom bindings
function bind_fish_keys
    bind \cw "forward-word"
    bind \cx "clear-screen"
end
bind_fish_keys

# Init agent
function init_ssh_agent
    # https://rabexc.org/posts/pitfalls-of-ssh-agents
    # https://stackoverflow.com/questions/40549332/how-to-check-if-ssh-agent-is-already-running-in-bash
    ssh-add -l &>/dev/null
    if test $status -eq 2
        # Could not open a connection to your authentication agent.
        # Load stored agent connection info.
        if test -r ~/.ssh-agent
            eval (cat ~/.ssh-agent) >/dev/null
        end

        ssh-add -l &>/dev/null
        if test $status -eq 2
            # Start agent and store agent connection info.
            begin
                umask 066
                ssh-agent -c > ~/.ssh-agent
            end
            eval (cat ~/.ssh-agent) >/dev/null
        end
    end

    # Load identities
    ssh-add -l &>/dev/null
    if test $status -eq 1
        # The agent has no identities.
        # Time to add one.
        ssh-add -t 8h &>/dev/null
    end
end
init_ssh_agent

# Source functions
source $FISH/functions/git.fish
source $FISH/functions/fn.fish
source $FISH/functions/fzf.fish
source $FISH/functions/hooks.fish
source $FISH/themes/zenbones.fish

fzf --fish | source
zoxide init fish --hook pwd --cmd j | source

