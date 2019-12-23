export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExgxcxcxCxegedabagacEc
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/bin:$PATH"

export GIT_PS1_SHOWDIRTYSTATE=1

function color_my_prompt {
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch='$(__git_ps1 " (%s)")'
    local __colored_branch="\[\033[31m\]$__git_branch"
    local __prompt_tail="\[\033[0;35m\]➤"
    local __reset_color="\[\033[00m\]"
    export PS1="$__cur_location$__colored_branch $__prompt_tail $__reset_color"
}
color_my_prompt

__ltrim_colon_completions ()
{
    if [[ "$1" == *:* && "$COMP_WORDBREAKS" == *:* ]]; then
        local colon_word=${1%"${1##*:}"};
        local i=${#COMPREPLY[*]};
        while [[ $((--i)) -ge 0 ]]; do
            COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"};
        done;
    fi
}
