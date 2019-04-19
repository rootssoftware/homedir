# The following lines were added by compinstall

zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-/]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion:*' use-cache on
zstyle :compinstall filename '~/.zsh/completion.zsh'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall
