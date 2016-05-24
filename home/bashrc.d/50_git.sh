#!/usr/bin/false

function git_rebase_patch() {
  git show $(head -1 .git/rebase-apply/${1} | awk '{ print $2 }')
}
