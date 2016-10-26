autoload -U compinit promptinit colors
colors
compinit
ZLS_COLORS=$LS_COLORS
promptinit
source ~/.zsh_prompt_gentoo_setup

setopt CORRECT AUTO_LIST AUTO_MENU NO_HUP
setopt NO_CHECK_JOBS PATH_DIRS NO_BEEP EXTENDED_GLOB
setopt C_BASES AUTO_NAME_DIRS RC_QUOTES 
setopt AUTOCD AUTOPUSHD SHORT_LOOPS
setopt HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_NO_STORE

cdpath=(~/projects)

unsetopt CASE_GLOB
unsetopt NOMATCH
HISTFILE=~/.zshhistory
HISTSIZE=300000
SAVEHIST=300000
compctl -g '*(-/) .*(-/)' cd
hosts=(
    "$_etc_hosts[@]"

    localhost
)

# funky zsh parsing for .ssh/{config,known_hosts}
# see http://zshwiki.org/home/examples/compsys/hostnames
[ -f ~/.ssh/config ] && : ${(A)ssh_config_hosts:=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
[ -f ~/.ssh/known_hosts ] && : ${(A)ssh_known_hosts:=${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}}


zstyle ':completion:*' hosts $hosts $ssh_config_hosts $ssh_known_hosts

# ALIASES
alias -g ...=../..
alias -g ....=../../..
alias -g .....=../../../..
alias -g ......=../../../../..
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias ..='cd ..'
alias ../..='cd ../..'
alias ../../..='cd ../../..'
alias ../../../..='cd ../../../..'
alias ../../../../..='cd ../../../../..'
alias cd/='cd /'
alias -g ZSHRC='~/.zshrc'

alias ls="ls --color"
alias deparse='perl -MO=Deparse -e'
alias grep="grep --color=auto"
alias s="sudo "
alias e="emerge "
alias l="ls"
alias ag="apt-get"
alias ac="apt-cache"
alias x="which" # x marks the spot!
alias vi="vim -u NONE "
alias whatismyip="wget http://ipinfo.io/ip -qO -"

alias -g ND='$(ls -d *(/om[1]))' # newest directory
alias -g NF='$(ls *(.om[1]))'    # newest file
alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'

# ^W kills parts of paths
WORDCHARS=${WORDCHARS//[&=\/;!#%\{]}

bindkey -e

# magic
bindkey " " magic-space

# on probation
bindkey '^i' expand-or-complete-prefix

bindkey '\eq' push-line-or-edit
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
# bindkey '\eOH' beginning-of-line
# bindkey '\eOF' end-of-line
# bindkey "\e[1~" beginning-of-line
# bindkey "\e[4~" end-of-line
bindkey "\e[5~" history-beginning-search-backward
bindkey "\e[6~" history-beginning-search-forward
bindkey "\e[3~" delete-char
# bindkey "\e[2~" quoted-insert
bindkey "\e[2~" overwrite-mode
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

. ~/.zshcomp

case $TERM in
	xterm*)
	preexec () {print -Pn "\e]0;%n@%m: %~\a"}
	;;

	screen)
#   precmd () {print -Pn "\e]0;%n@%m: %~\a"}
	preexec () { echo -ne "\ek${1%% *}\e\\" }
	;;
esac

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
iterm2_print_user_vars() {
	iterm2_set_user_var hostname $(echo $HOSTNAME | cut -f 1 -d '.')
}
