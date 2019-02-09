#!/bin/bash
set -e;

testSourcePath=$(dirname "${BASH_SOURCE:-$0}");

source "$testSourcePath/../index.sh";
source "$testSourcePath/mocks.sh";

test() {
  reset-mocks;
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
ls $testSourcePath |
  grep ".test.sh" |
  while read file; do source "$testSourcePath/$file"; done;

echo "All tests passed successfully!";
