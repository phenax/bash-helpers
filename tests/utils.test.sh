#!/bin/bash

echo "cool";

import-module "../utils.sh";


{ # Get branch name tests
  assertEq "master" $(git-get-branch-name);

  git checkout foobar > /dev/null;
  assertEq "foobar" $(git-get-branch-name);
}
