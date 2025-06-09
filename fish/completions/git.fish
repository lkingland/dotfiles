# Completions for git wrapper functions

# Basic git commands
complete -c ga -w "git add"
complete -c gb -w "git branch"
complete -c gba -w "git fetch"
complete -c gc -w "git commit"
complete -c gca -w "git commit"
complete -c gco -w "git checkout"
complete -c gp -w "git pull"
complete -c gr -w "git remote"
complete -c gs -w "git status"
complete -c gt -w "git tag"
complete -c gtd -w "git tag"
complete -c gu -w "git push"

# Git log commands
complete -c gl -w "git log"
complete -c gll -w "git log"
complete -c glog -w "git log"

# Git diff commands (including difftastic variants)
complete -c gd -w "git diff"
complete -c dl -w "git log"
complete -c ds -w "git show"
complete -c dt -w "git diff"
