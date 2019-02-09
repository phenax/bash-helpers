#!/bin/bash

echo "cool";

import-module "../utils.sh";


{ # Get branch name

  # Should return default (master)
  assertEq "master" $(git-get-branch-name);

  # Should return the new checked out branch
  git checkout foobar > /dev/null;
  assertEq "foobar" $(git-get-branch-name);
}


{ # Get remote url

  # Should return remote origin url
  assertEq "https://url.com/repo.git" $(git-get-remote-url);

  # Should return remote upstream
  assertEq "https://url.com/upstream-repo.git" $(git-get-remote-url upstream);
}
