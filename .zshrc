### Stijn's zshrc
# source ~/.zsh/antigen.zsh
# antigen use oh-my-zsh
#
# antigen bundle git
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle lein
# antigen bundle rupa/z
#
# SPACESHIP_PROMPT_SYMBOL=">"
# SPACESHIP_BATTERY_SHOW="false"
# SPACESHIP_BATTERY_ALWAYS_SHOW="false"
#
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
# antigen apply
#
# source /opt/google-cloud-sdk/path.zsh.inc
# source /opt/google-cloud-sdk/completion.zsh.inc
#
# source ~/.aliases
# source ~/.exports
### end Stijn's zshrc

fpath=($HOME/.zsh_completion $fpath)
autoload -U compinit
compinit

autoload -U colors
colors
ZLS_COLORS=$LS_COLORS

autoload -U promptinit
promptinit
source ~/.zsh/prompt_gentoo_setup.zsh

setopt CORRECT AUTO_LIST AUTO_MENU NO_HUP
setopt NO_CHECK_JOBS PATH_DIRS NO_BEEP EXTENDED_GLOB
setopt C_BASES AUTO_NAME_DIRS RC_QUOTES 
setopt AUTOCD AUTOPUSHD SHORT_LOOPS
setopt HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_NO_STORE

setopt auto_cd

cdpath=(~/programming /opt)

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
alias ag="apt-get"
alias ac="apt-cache"
alias x="which" # x marks the spot!
alias vi="vim -u NONE "
alias whatismyip="wget http://ipinfo.io/ip -qO -"
alias wget-java="wget --no-check-certificate --no-cookies --header \"Cookie: oraclelicense=accept-securebackup-cookie\" "

alias -g ND='$(ls -d *(/om[1]))' # newest directory
alias -g NF='$(ls *(.om[1]))'    # newest file
alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'
alias -g PID="| awk '{ print \$2 }'"
alias -g A='| awk'
alias -g KILL9="| xargs kill -9"

function exportfile () {
	file=$1
	eof=${2:-EOF}
	echo "cat <<$eof >$file"
	sed -e 's/\\/\\\\/g' -e 's/\$/\\$/g' -e 's/`/\\`/g' -e $'s/\t/  /g' -e '$a\' $file
	echo $eof
}

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

. ~/.zsh/completion.zsh

case $TERM in
	xterm*)
	preexec () {print -Pn "\e]0;%n@%m: %~\a"}
	;;

	screen)
#   precmd () {print -Pn "\e]0;%n@%m: %~\a"}
	preexec () { echo -ne "\ek${1%% *}\e\\" }
	;;
esac

test -f ~/.bin/dev && . ~/.bin/dev

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
iterm2_print_user_vars() {
	iterm2_set_user_var hostname $(echo $HOSTNAME | cut -f 1 -d '.')
}

test -f .zsh_local && . .zsh_local
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
