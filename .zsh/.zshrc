# .zshrc

# compile (if you have no .zshrc.zwc, execute "zcompile .zshrc" once)
if [ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

# check already installed zplug
if [ ! -d "$ZPLUG_HOME" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# zplug plugin installation
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# Completion
autoload -Uz compinit
compinit

# load bash complement script
autoload -U +X bashcompinit && bashcompinit
# set terraform command completion
complete -o nospace -C /usr/local/bin/terraform terraform

# Color
autoload -Uz colors
colors
 
# Load theme
source $ZDOTDIR/.theme.zsh

# Load profile
source $ZDOTDIR/.zprofile

# Use vim key bind
bindkey -v

# Directory Stack
setopt auto_pushd
# Ignore pushd duplication
setopt pushd_ignore_dups
# Change directory without cd command
setopt auto_cd
# Ignore history duplication
setopt hist_ignore_all_dups
# Redule blank
setopt hist_reduce_blanks
# Ignore space
setopt hist_ignore_space

# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Use user local path 
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

# Ruby configurations
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yinhr/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yinhr/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yinhr/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yinhr/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# fzf plugin configuration
source $ZDOTDIR/.fzf.zsh
