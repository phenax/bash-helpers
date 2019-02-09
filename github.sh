#!/bin/bash

import-module "utils.sh";

git-open() {
  local url=$(git-get-remote-url $1);
  if [ "$url" == "" ]; then
    echo "No remote url found for $1";
  else
    xdg-open "$url";
  fi;
}

git-open-pr() {
  local remote=${1:-"origin"};
  local targetBranch=${2:-"master"};
  local localBranch=$(git-get-branch-name);
  local url=$(git-get-remote-url $remote);

  if [ "$url" == "" ]; then
    echo "No remote url found for $1";
  else
    url="$url/compare/$targetBranch...$localBranch";
    xdg-open "$url";
  fi;
}
