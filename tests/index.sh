#!/bin/bash

# Returns absolute directory of a file/dir path
absolute-dir() { echo $(dirname "$(realpath $1)"); }

# Import module with an absolute path
import-module() { source "$(absolute-dir $0)/$1"; }

assertEq() {
  [ "$1" == "$2" ] || {
    echo "Test Failed! Expected $1, but got $2";
  }
} 

# Import all test files
ls $(absolute-dir $0) |
  grep ".test.sh" |
  while read file; do import-module $file; done;
