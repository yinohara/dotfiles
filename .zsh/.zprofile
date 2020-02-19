# alias
alias ls='ls -G'
alias la='ls -a -G'
alias ll='ls -l -G'
alias lla='ls -la -G'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias vim='nvim'
alias history='history -E'
alias ctags="`brew --prefix`/bin/ctags"
alias be='bundle exec'

# cd -> cd + ls
function cd() {
  builtin cd $@ && ls;
}
