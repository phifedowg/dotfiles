# zsh config
# by phife
# sources
source /home/phife/.antigen/antigen.zsh
source /home/phife/.zsh_aliases
# export
export ZSH=/home/phife/.antigen/bundles/robbyrussell/oh-my-zsh
export PATH=/usr/local/bin:$PATH

EDITOR=/usr/bin/vim
BROWSER=/usr/bin/chromium

export HCLOUD_TOKEN=IPiR5mcjyDTDbrrj5ONnk0Rm6NZtdVoCCkqjGNA0wk8UFnsAcuXRAtNXENvb516e
export HCLOUD_CONTEXT=
export HCLOUD_CONFIG=

# oh-my-zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle systemd
antigen bundle docker
antigen bundle bundler
antigen bundle colorize
antigen bundle encode64#
antigen bundle github

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme duellj

# Tell Antigen that you're done.
antigen apply

## History wrapper
function omz_history {
  # Delete the history file if `-c' argument provided.
  # This won't affect the `history' command output until the next login.
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # otherwise, call `fc -l 1` to show all available
    # history (and pass additional parameters)
    builtin fc "$@" -l 1
  fi
}

# Timestamp format
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000000
SAVEHIST=1000000
## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data


# plugins
plugins=(git)

# keybindings
#bindkey -v
#bindkey '^R' history-incremental-search-backward

fpath+=(~/.config/hcloud/completion/zsh)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
eval "$(starship init zsh)"
