# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm)
## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
export EDITOR=nvim
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
if [ -f ~/.config/zsh/bindings ]; then
    source ~/.config/zsh/bindings
else
    print "404: ~/.config/zsh/bindings not found."
fi

## Alias section 
if [ -f ~/.config/zsh/aliases ]; then
    source ~/.config/zsh/aliases
else
    print "404: ~/.config/zsh/aliases not found."
fi

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/michele/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/michele/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/michele/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /home/michele/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/michele/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /home/michele/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh

# Node Version Manager
export PATH=~/.nvm/versions/node/v12.18.4/bin:$PATH
export NVM_DIR="$HOME/.config/nvm"
source "$NVM_DIR/nvm.sh" --no-use  # --no-use increases startup time, must explicitely call `nvm use`

export PATH="/usr/local/opt/awscli@1/bin:$PATH"


eval "$(direnv hook zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
#zinit ice proto"ssh"
#zinit light "zinit-zsh/z-a-rust"
#zinit light "zinit-zsh/z-a-as-monitor"
#zinit light "zinit-zsh/z-a-patch-dl"
#zinit light "zinit-zsh/z-a-bin-gem-node"

# Plugins section
zinit light "zpm-zsh/colors"                          # Enhanced colors
zinit light "zsh-users/zsh-history-substring-search"  # Use history substring search
zinit light "zsh-users/zsh-syntax-highlighting"       # Use syntax highlighting
zinit light "zpm-zsh/autoenv"                         # automatically sources  .in and .out files.
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Use autosuggestion
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

if [[ `uname` == "Darwin" ]]; then
    export TERM=xterm-256color-italic
fi
