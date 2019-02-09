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
  local remote=${2:-"origin"};
  local targetBranch=${1:-"master"};
  local localBranch=$(git-get-branch-name);
  local url=$(git-get-remote-url $remote);

  if [ "$url" == "" ]; then
    echo "No remote url found for $remote";
  else
    url="$url/compare/$targetBranch...$localBranch";
    xdg-open "$url";
  fi;
}

git-new-issue() {
  local remote=${2:-"origin"};
  local url=$(git-get-remote-url $remote);
  local title=${1:-"New issue"};

  if [ "$url" == "" ]; then
    echo "No remote url found for $remote";
  else
    url="$url/issues/new?title=$title";
    xdg-open "$url";
  fi;
}

