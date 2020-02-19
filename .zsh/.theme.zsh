# phytk theme for Zsh

# Prompt:
# %~ => Current path
# %(x.true.false) => Specifies a ternary expression
#   ! => True if the shell is running with root privileges
#   ? => True if the exit status of the last command was success
#
# Git:
# %a => Current action (rebase/merge)
# %b => Current branch
# %c => Staged changes
# %u => Unstaged changes
#
# $vcs_info_msg_0_ : message

# PROMPT変数内で変数展開やスクリプト実行が可能になる
setopt PROMPT_SUBST
# load add-zsh-hook
autoload -Uz add-zsh-hook
# load vcs_info to get git info
autoload -Uz vcs_info
# load is-at-least to check zsh version
autoload is-at-least

# Use True color (24-bit) if available.
if [[ "${terminfo[colors]}" -ge 256 ]]; then
  phytk_turquoise="%F{74}"
  phytk_orange="%F{179}"
  phytk_red="%F{168}"
  phytk_limegreen="%F{113}"
else
  phytk_turquoise="%F{cyan}"
  phytk_orange="%F{yellow}"
  phytk_red="%F{red}"
  phytk_limegreen="%F{green}"
fi

# Reset color.
phytk_reset_color="%f"

# VCS style formats.
FMT_UNSTAGED="%{$phytk_reset_color%} %{$phytk_orange%}●"
FMT_STAGED="%{$phytk_reset_color%} %{$phytk_limegreen%}✚"
FMT_ACTION="(%{$phytk_limegreen%}%a%{$phytk_reset_color%})"
FMT_VCS_STATUS="on %{$phytk_turquoise%} %b%u%c%m%{$phytk_reset_color%}"

# enable git check
zstyle ':vcs_info:*' enable git
# set when no version control system detected for the current directory
zstyle ':vcs_info:*' nvcsformats    ""
# commit していない変更をチェック
zstyle ':vcs_info:git:*' check-for-changes true
# add していない変更をチェック %u
zstyle ':vcs_info:git:*' unstagedstr    "${FMT_UNSTAGED}"
# commit していないstageをチェック %c
zstyle ':vcs_info:git:*' stagedstr      "${FMT_STAGED}"
# コンフリクトなどの情報を表示
zstyle ':vcs_info:git:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
# 変更情報とリポジトリ情報を表示
zstyle ':vcs_info:git:*' formats        "${FMT_VCS_STATUS}"
# メッセージのセットとhook関数の呼び出し
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-ahead git-behind git-stash

# Check for untracked files.
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep --max-count=1 '^??' &> /dev/null; then
    hook_com[staged]+="%{$phytk_reset_color%} %{$phytk_red%}●"
  fi
}

# Check for local ahead of remote branch
+vi-git-ahead() {
  if [[ "${hook_com[branch]}" != "master" ]]; then
    return 0
  fi

  local n_ahead
  n_ahead=$(git rev-list origin/master..master 2>/dev/null | wc -l | tr -d ' ')

  if [[ "$n_ahead" -gt 0 ]]; then
    hook_com[misc]="%{$phytk_reset_color%} %{$phytk_limegreen%}▲"
  fi
}

# Check for local behind of remote branch
+vi-git-behind() {
  if [[ "${hook_com[branch]}" != "master" ]]; then
    return 0
  fi

  local n_behind
  n_behind=$(git rev-list master..origin/master 2>/dev/null | wc -l | tr -d ' ')

  if [[ "$n_behind" -gt 0 ]]; then
    hook_com[misc]+="%{$phytk_reset_color%} %{$phytk_limegreen%}▼"
  fi
}

# Check for stash
+vi-git-stash() {
  local n_stash
  n_stash=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
  if [[ n_stash -gt 0 ]]; then
    hook_com[misc]+="%{$phytk_reset_color%} %{$phytk_limegreen%}↩︎"
  fi
}

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# prompt style.
PROMPT=$'\n%{$phytk_limegreen%}%~%{$phytk_reset_color%} ${vcs_info_msg_0_}\n%(?.%{%F{white}%}.%{$phytk_red%})%(!.#.❯)%{$phytk_reset_color%} '
