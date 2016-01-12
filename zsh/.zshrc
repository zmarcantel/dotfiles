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

# standard {user}{path}{time}
PLAIN+="%{$fg_bold[red]%}%n%{$reset_color%}@%m "
PLAIN+="in"
PLAIN+="%{$fg_bold[cyan]%} %~ %{$reset_color%}"
PLAIN+="at"
PLAIN+="%{$fg_bold[green]%} %T %{$reset_color%}"

# add git info to the prompt
. ~/.zmenv/zsh-git


# nothing on the rprompt
RRPOMPT=""

function precmd() {
	RPROMPT=""
    PROMPT=$PLAIN

    # do git stuff for the left prompt
    if git rev-parse --git-dir > /dev/null 2>&1; then
        PROMPT+=$(git_prompt)
    fi
    PROMPT+=" %{$fg_bold[white]%}λ %{$reset_color%}"

	# previous command run details on right prompt
    RIGHT=""
	if [ $timer ]; then
    	timer_show=$(($SECONDS - $timer))
		if [ $timer_show -lt 1 ]; then
			# nop for cleanliness of <1s commands
		elif [ $timer_show -gt 60 ]; then
			# show as {Xm Xs}
			timer_show=$(( $timer_show / 60 ))"m "$(( $timer_show % 60 ))"s"
			export RIGHT="%{$fg_bold[grey]%}{${timer_show}}%{$reset_color%}"
		else
			# show as {Xs}
			export RIGHT="%{$fg_bold[grey]%}{${timer_show}s}%{$reset_color%}"
		fi
		unset timer
	fi

    # return code of last command
    RPROMPT="%{$fg_bold[grey]%}[%?]%{$reset_color%} "
    RPROMPT+=$RIGHT

    SPOTIFY_INFO=$(spotifyctl.py --info)
    SONG_NAME=$(echo $SPOTIFY_INFO | grep "xesam:title" | sed 's/xesam:title //')
    SONG_ARTIST=$(echo $SPOTIFY_INFO | grep "xesam:artist" | sed 's/xesam:artist //' )

    MAX_SONG_LENGTH=20
    MAX_ARTIST_LENGTH=20

    if [ ${#SONG_NAME} -gt $MAX_SONG_LENGTH ]; then
        SONG_NAME=$(echo $SONG_NAME[0,$MAX_SONG_LENGTH] | sed 's/\s\+$//')"..."
    fi
    if [ ${#SONG_ARTIST} -gt $MAX_ARTIST_LENGTH ]; then
        SONG_ARTIST=$(echo $SONG_ARTIST[0,$MAX_ARTIST_LENGTH] | sed 's/\s\+$//')"..."
    fi

    RPROMPT+=" [%{$fg_bold[blue]%}"$SONG_NAME"%{$reset_color%} %{$fg_bold[green]%}"$SONG_ARTIST"%{$reset_color%}]"
}

##
## Aliases
##

. ~/.zmenv/alias

##
## Exports
##

. ~/.zmenv/export
