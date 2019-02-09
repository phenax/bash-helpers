#!/bin/bash

import-module "github.sh";

test "git-open-repo"; {

  # Should trigger xdg-open with repo url
  git-open-repo;
  assertEq "https://url.com/repo" "$mockLastOpenedUrl";

  # Should trigger xdg-open with upstream url
  git-open-repo upstream;
  assertEq "https://url.com/upstream-repo" "$mockLastOpenedUrl";

  mockLastOpenedUrl="";
  # Should return exit code 1, if repo was not found
  local res=$(git-open-repo hello);
  assertEq "No remote url found for hello" "$res";
  assertEq "" "$mockLastOpenedUrl";
}

test "git-open-pr"; {

  # Should trigger xdg-open with repo's pr url
  git checkout my-branch > /dev/null;
  git-open-pr;
  assertEq "https://url.com/repo/compare/master...my-branch" "$mockLastOpenedUrl";

  # Should open pr url with upstream branch
  git-open-pr upstream;
  assertEq "https://url.com/upstream-repo/compare/master...my-branch" "$mockLastOpenedUrl";

  # Should trigger xdg-open with upstream url
  git-open-pr upstream develop;
  assertEq "https://url.com/upstream-repo/compare/develop...my-branch" "$mockLastOpenedUrl";

  mockLastOpenedUrl="";
  # Should return exit code 1, if repo was not found
  local res=$(git-open-pr hello);
  assertEq "No remote url found for hello" "$res";
  assertEq "" "$mockLastOpenedUrl";
}

