#!/bin/bash

import-module "utils.sh";

git-open-repo() {
  local url=$(git-get-remote-url $1);
  if [ "$url" == "" ]; then
    echo "No remote url found for $1";
  else
    xdg-open "$url";
  fi;
}

git-open-pr() {
  local targetBranch=${1:-"master"};
  local localBranch=$(git-get-branch-name);

  local remote=${2:-"origin"};
  local url=$(git-get-remote-url $remote);

  if [ "$url" == "" ]; then
    echo "No remote url found for $remote";
  else
    url="$url/compare/$targetBranch...$localBranch";
    xdg-open "$url";
  fi;
}

git-new-issue() {
  local title=${1:-"New issue"};

  local remote=${2:-"origin"};
  local url=$(git-get-remote-url $remote);

  if [ "$url" == "" ]; then
    echo "No remote url found for $remote";
  else
    url="$url/issues/new?title=$title";
    xdg-open "$url";
  fi;
}

git-sync() {
  local targetBranch=${1:-"master"};
  local remoteName=${2:-"origin"};

  git pull $remoteName $targetBranch;
}

