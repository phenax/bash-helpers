#!/bin/bash

import-module "github.sh";

test "git-open"; {

  # Should trigger xdg-open with given url
  git-open;
  assertEq "https://url.com/repo.git" "$mockLastOpenedUrl";

  # Should trigger xdg-open with upstream url
  git-open upstream;
  assertEq "https://url.com/upstream-repo.git" "$mockLastOpenedUrl";

  mockLastOpenedUrl="";
  # Should return exit code 1, if repo was not found
  local res=$(git-open hello);
  assertEq "No remote url found for hello" "$res";
  assertEq "" "$mockLastOpenedUrl";
}
