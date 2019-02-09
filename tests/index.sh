#!/bin/bash
set -e;

# Returns absolute directory of a file/dir path
absolute-dir() { echo $(dirname "$(realpath $1)"); }

# Import module with an absolute path
import-test-module() { source "$(absolute-dir $BASH_SOURCE)/$1"; }

import-test-module "mocks.sh";
import-test-module "../index.sh";


test() {
  echo "-- $1";
}

# Assert equality between two values
assertEq() {
  [ "$1" == "$2" ] || {
    echo "Test Failed! Expected \"$1\", but got \"$2\"";
    return 1;
  }
}

# Import all test files
ls $(absolute-dir $BASH_SOURCE) |
  grep ".test.sh" |
  while read file; do import-test-module $file; done;

echo "All tests passed successfully!";
