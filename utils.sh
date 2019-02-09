#!/bin/bash

# Get current branch name
git-get-branch-name() {
  echo "$(
    git status |
    grep 'On branch' |
    grep -oP "\\S+" |
    tail -1
  )";
}

# Get remote url
git-get-remote-url() {
  local remoteName=${1:-"origin"};
  local url="$(
    git remote -v |
    grep $remoteName |
    head -1 |
    grep -oP "(https?://(.*))\\.git" -m 1
  )";

  echo "${url/.git/}"; # Remove .git extension
}

# alias git-amend="git commit --amend";
# alias git-sync="git pull origin develop";
# alias git-unstage="git reset HEAD";
# alias git-open="xdg-open $(git-get-remote-url)";


