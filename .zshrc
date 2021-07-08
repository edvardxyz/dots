unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ed/.config/zsh/.zshrc'

# End of lines added by compinstall
# Make tab complete case insensitive
setopt NO_CASE_GLOB

# Share history across multiple zsh sessions and append
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# Expire duplicates first
# setopt HIST_EXPIRE_DUPS_FIRST

# Remove duplicates
setopt HIST_IGNORE_ALL_DUPS

# Verify substituted command
setopt HIST_VERIFY

# Ask for correction path or command
# setopt CORRECT
# setopt CORRECT_ALL

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%20<...<%~%<<%{$fg[red]%}]%{$reset_color%}$%b "
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%% "
PS1="%{$fg[red]%}%n%{$reset_color%} %{$fg[darkgrey]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}>"

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# Git prompt stuff
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=/home/ed/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit promptinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache 1
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# promptinit; prompt gentoo

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
 function zle-keymap-select {
   if [[ ${KEYMAP} == vicmd ]] ||
      [[ $1 = 'block' ]]; then
     echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Copy current dirctory into clipbaord
alias cpdir='print -n $PWD | xclip -i -selection clipboard'

### ALIASES ###
alias ls='ls --color=auto'
alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cal='cal -m'

alias poweroff='doas poweroff'
alias reboot='doas reboot'

alias dmesg='dmesg --human'

alias v=nvim
alias vi=nvim
alias vim=nvim
alias vis=nvim


# gpg
export GPG_TTY=$(tty)

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Load plugins; should be last.
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
