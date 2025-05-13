if status is-interactive
    # pass
end

set -gx LS_COLORS (vivid generate catppuccin-mocha)
set -gx EDITOR nvim
set -U fish_greeting # disable greeting
set fish_vi_key_bindings # use vi bindings to edit commands
set fish_cursor_default block blink # match neovim config
set fish_cursor_insert line blink
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

# Paths
# -----
set fish_add_path ~/src/github.com/lkingland/sh

# XDG
if not set -q XDG_CONFIG_HOME
    set -gx XDG_CONFIG_HOME $HOME/.config
end

if not set -q XDG_CACHE_HOME
    set -gx XDG_CACHE_HOME $HOME/.cache
end

# Aliases
# -------
function c; clear; end
function e; exit; end
function k --wraps kubectl; kubectl $argv; end
function s; sudo $argv; end
function v --wraps nvim; nvim $argv; end

# Eza
function l --wraps eza; eza -l --icons --git $argv; end
function ll --wraps eza; eza -l --icons --git -a $argv; end
function lt --wraps eza; eza --tree --level=2 --long --icons --git; end
function ltree --wraps eza; eza --tree --level=2  --icons --git; end

# Bitwarden
function bw-unlock
    command bw unlock --raw > ~/.bw-session # unlock and store sessionID
end
function bw
    command bw --session=(cat ~/.bw-session) $argv # decorate with session
end

# git
function ga; git add $argv; end
function gb; git branch $argv; end
function gba; git fetch -ap && git branch -a; end
function gc; git commit $argv; end
function gca; git commit -a $argv; end
function gco; git checkout $argv; end
function gd; git diff; end
function gp; git pull; end
function gr; git remote -v; end
function gs; git status -sb; end
function gt; git tag --sort=version:refname; end
function gtd; git tag --delete $argv; end
function gu; git push; end
function gl
    git log -n 10 --graph --pretty=format:"%Cgreen%h%Creset %an: %s %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative
end
function gll
    git log --graph --pretty=format:"%Cgreen%h%Creset %an: %s %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative
end
function glog
    git log --graph --topo-order --pretty=format:"%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N" --abbrev-commit
end

# Initializers
# ------------
zoxide init fish | source # cd++
starship init fish | source # prompt
atuin init fish | source # history
carapace _carapace | source # command completion
# vincent _carapace | source # Seems to have no effect

