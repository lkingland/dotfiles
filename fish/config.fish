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
set -gx GIT_EXTERNAL_DIFF difft

# Paths
# -----
fish_add_path ~/go/bin
fish_add_path ~/src/github.com/lkingland/sh
fish_add_path /opt/podman/bin
fish_add_path /opt/homebrew/opt/openjdk/bin

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
function k --wraps "kubectl"; kubectl $argv; end
function s; sudo $argv; end
function v --wraps "nvim"; nvim $argv; end
function cx 
    mkdir -p $argv[1] && cd $argv[1]
end

# Eza
function l --wraps "eza"; eza -l --icons --git $argv; end
function ll --wraps "eza"; eza -l --icons --git -a $argv; end
function lt --wraps "eza"; eza --tree --level=2 --long --icons --git; end
function ltree --wraps "eza"; eza --tree --level=2  --icons --git; end

# Bitwarden
function bw-unlock
    command bw unlock --raw > ~/.bw-session # unlock and store sessionID
end
function bw
    command bw --session=(cat ~/.bw-session) $argv # decorate with session
end

# git
function ga --wraps "git add"; git add $argv; end
function gb --wraps "git branch"; git branch $argv; end
function gba --wraps "git fetch"; git fetch -ap && git branch -a; end
function gc --wraps "git commit"; git commit $argv; end
function gca --wraps "git commit"; git commit -a $argv; end
function gco --wraps "git checkout"; git checkout $argv; end
function gp --wraps "git pull"; git pull $argv; end
function gr --wraps "git remote"; git remote -v $argv; end
function gs --wraps "git status"; git status -sb $argv; end
function gt --wraps "git tag"; git tag --sort=version:refname $argv; end
function gtd --wraps "git tag"; git tag --delete $argv; end
function gu --wraps "git push"; git push $argv; end
function gl
    git log -n 10 --graph --pretty=format:"%Cgreen%h%Creset %an: %s %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative
end
function gll
    git log --graph --pretty=format:"%Cgreen%h%Creset %an: %s %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative
end
function glog
    git log --graph --topo-order --pretty=format:"%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N" --abbrev-commit
end

# git diff (builtin)
function gd --wraps "git diff"; git diff $argv; end
# "diff log": `git log` with patches shown with difftastic.
function dl --wraps "git log"; git -c diff.external=difft log -p --ext-diff $argv; end
# "diff show": show most recent diff using difftastic
function ds --wraps "git show"; git -c diff.external=difft show --ext-diff $argv; end
# "difftastic": git diff using difftastic
function dt --wraps "git diff"; git -c diff.external=difft diff $argv; end

# jj
# Current changes, a little about remote branches, and the trunk:
function jll; jj log -r '@ | ancestors(remote_bookmarks().., 2) | trunk()'; end

# Screencasts
# Add to ~/.config/fish/config.fish or ~/.config/fish/functions/ghostty-setup-active.fish
function screencast-setup-window --description 'Set active Ghostty window to 16pt font and 1920x1080'
    osascript -e '
    tell application "System Events"
        if not (exists process "Ghostty") then
            return "Ghostty not running"
        end if
        
        set frontApp to name of first application process whose frontmost is true
        if frontApp is not "Ghostty" then
            tell application "Ghostty" to activate
            delay 0.2
        end if
        
        tell application process "Ghostty"
            set activeWin to front window
            
            -- Set font size to 16
            keystroke "0" using {command down}
            delay 0.5
            repeat 5 times
                keystroke "=" using {command down}
                delay 0.1
            end repeat

            -- Resize active window only
            tell activeWin
                -- Slightly beyon 1920x1080 for clipping
                set size to {1920, 1110}
                set position to {0, 25}
            end tell
        end tell
    end tell
    '
end

# Initializers
# ------------
zoxide init fish | source # cd++
starship init fish | source # prompt
atuin init fish --disable-up-arrow | source # history
carapace _carapace | source # command completion
# vincent _carapace | source # Seems to have no effect

