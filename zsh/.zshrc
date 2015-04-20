# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zach/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


autoload -U colors && colors

##
## Basic Setup
##

export TERM=xterm-256color


##
## Prompt
##

function preexec() {
  timer=${timer:-$SECONDS}
}

# start with empty prompt
PLAIN=""

# return code of last command
PLAIN+="%{$fg_bold[grey]%}[%?]%{$reset_color%} "

# standard {user}{path}{time}
PLAIN+="%{$fg_bold[red]%}%n%{$reset_color%} "
PLAIN+="in"
PLAIN+="%{$fg_bold[cyan]%} %~ %{$reset_color%}"
PLAIN+="at"
PLAIN+="%{$fg_bold[green]%} %T %{$reset_color%}"

# add git info to the prompt
. ~/.zmenv/zsh-git


# nothing on the rprompt
RRPOMPT=""

function precmd() {
	PROMPT=""

	# previous command run time
	if [ $timer ]; then
    	timer_show=$(($SECONDS - $timer))
		if [ $timer_show -lt 1 ]; then
			# nop for cleanliness of <1s commands
		elif [ $timer_show -gt 60 ]; then
			# show as {Xm Xs}
			timer_show=$(( $timer_show / 60 ))"m "$(( $timer_show % 60 ))"s"
			export PROMPT="%{$fg_bold[grey]%}{${timer_show}}%{$reset_color%}"
		else
			# show as {Xs}
			export PROMPT="%{$fg_bold[grey]%}{${timer_show}s}%{$reset_color%}"
		fi
		unset timer
	fi

    PROMPT+=$PLAIN

    if git rev-parse --git-dir > /dev/null 2>&1; then
        PROMPT+=$(git_prompt)
    fi

    PROMPT+=" %{$fg_bold[white]%}λ %{$reset_color%}"
}

##
## Aliases
##

. ~/.zmenv/alias

##
## Exports
##

. ~/.zmenv/export
