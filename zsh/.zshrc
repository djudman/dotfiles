autoload -Uz compinit; compinit
autoload -U +X bashcompinit && bashcompinit
setopt PROMPT_SUBST

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export LSCOLORS=ExfxCxDxCxCgedabagaced
export CLICOLOR=1

source ~/.config/dotfiles/zsh/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWUPSTREAM=true
export GIT_PS1_SHOWCOLORHINTS=true

export PS1="%F{blue}%B%~%b%f\$(__git_ps1 \" (%s)\") %F{magenta}➤%f "
export PATH=/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH:/opt/homebrew/bin

alias ll='ls -la'
