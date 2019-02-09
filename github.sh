#!/bin/bash

import-module "utils.sh";

# echo "$(git-get-branch-name)";
# echo "$(git-get-remote-url)";

git-open() {
  local url=$(git-get-remote-url $1);
  if [ "$url" == "" ];
  then
    echo "No remote url found for $1";
  else
    xdg-open "$url";
  fi;
}
