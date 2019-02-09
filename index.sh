#!/bin/bash

# Get source script path
get-source-path() {
  if [[ "$BASH_SOURCE" == /* ]]; then
    echo "$BASH_SOURCE";
  else if [[ "$0" == /* ]]; then
    echo "$0";
  else if [[ "$1" == /* ]]; then
    echo "$1";
  else
    echo "~";
  fi; fi; fi;
}

sourcePath="$(get-source-path "$@")";

# Import module with an absolute path
import-module() { source "$(dirname $sourcePath)/$1"; }

import-module "utils.sh";
import-module "git.sh";
