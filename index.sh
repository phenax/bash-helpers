#!/bin/bash

# Returns absolute directory of a file/dir path
# absolute-dir() { echo $(dirname "$(realpath $1)"); }

# Get source script path
get-source-path() {
  if [[ "$0" == /* ]]; then
    echo "$0";
  else if [[ "$1" == /* ]]; then
    echo "$1";
  else
    echo "$BASH_SOURCE";
  fi; fi;
}

sourcePath="$(get-source-path $@)";

# Import module with an absolute path
import-module() { source "$(dirname $sourcePath)/$1"; }

import-module "utils.sh";
import-module "github.sh";
