#
# Custom ZSH Widgets.
#
# Authors:
#   Andrew Goudzwaard
#
#
# Switch to a git branch selected with fzf.
function _git_branch_widget() {
  local dir
  branch=$(git branch --verbose | fzf --reverse | sed 's/^[*+] /  /' | awk '{ print $1 }')
  [[ -n "$branch" ]] && git checkout "$branch" &>/dev/null
  zle reset-prompt
}
zle -N _git_branch_widget
bindkey '^B' _git_branch_widget

# Switch to a git worktree directory selected with fzf.
function _git_worktree_widget() {
  local dir
  dir=$(git worktree list | fzf --reverse | awk '{ print $1 }')
  [[ -n "$dir" ]] && cd "$dir"
  zle reset-prompt
}
zle -N _git_worktree_widget
bindkey '^W' _git_worktree_widget
