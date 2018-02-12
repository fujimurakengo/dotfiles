export EDITOR=vim
setopt interactive_comments

#Alias
##Directory
alias cd..="cd .."
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias s=":"
alias la="ls -a --color=auto"

##Git
alias add="git add"
alias commit="git commit"
alias push="git push"
alias pull="git pull"

# Set up the prompt
setopt histignorealldups sharehistory

# Keep history save it to ~/.zsh_history:
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
setopt extended_history
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history

#ls color

# Use modern completion system
autoload -U compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

autoload colors
colors

PROMPT="%{$fg[green]%}%~ %(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT=""

#Exec tmux
if [[ ! -n $TMUX ]]; then
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux -2 new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux -2 new-session
  elif [[ -n "$ID" ]]; then
    tmux -2 attach-session -t "$ID"
  else
    tmux -2 new-session
  fi
fi
