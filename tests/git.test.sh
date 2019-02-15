#!/bin/bash

import-module "git.sh";

test "git-open-repo"; {

  # Should trigger xdg-open with repo url
  git-open-repo;
  assertEq "https://url.com/repo" "$mockLastOpenedUrl";

  # Should trigger xdg-open with upstream url
  git-open-repo upstream;
  assertEq "https://url.com/upstream-repo" "$mockLastOpenedUrl";

  mockLastOpenedUrl="";
  # Should return exit code 1, if repo was not found
  res=$(git-open-repo hello);
  assertEq "No remote url found for hello" "$res";
  assertEq "" "$mockLastOpenedUrl";
}

test "git-open-pr"; {

  # Should trigger xdg-open with repo's pr url
  git checkout my-branch > /dev/null;
  git-open-pr;
  assertEq "https://url.com/repo/compare/master...my-branch" "$mockLastOpenedUrl";

  # Should open pr url with upstream branch
  git-open-pr master upstream;
  assertEq "https://url.com/upstream-repo/compare/master...my-branch" "$mockLastOpenedUrl";

  # Should trigger xdg-open with upstream url
  git-open-pr develop upstream;
  assertEq "https://url.com/upstream-repo/compare/develop...my-branch" "$mockLastOpenedUrl";

  mockLastOpenedUrl="";
  # Should return exit code 1, if repo was not found
  res=$(git-open-pr master hello);
  assertEq "No remote url found for hello" "$res";
  assertEq "" "$mockLastOpenedUrl";
}

test "git-new-issue"; {

  # Should trigger xdg-open with repo's new issue url with default title
  git-new-issue;
  assertEq "https://url.com/repo/issues/new?title=New issue" "$mockLastOpenedUrl";

  # Should open new issue url with upstream branch
  git-new-issue "" upstream;
  assertEq "https://url.com/upstream-repo/issues/new?title=New issue" "$mockLastOpenedUrl";

  # Should trigger xdg-open with issue url with custom title
  git-new-issue "Custom message";
  assertEq "https://url.com/repo/issues/new?title=Custom message" "$mockLastOpenedUrl";

  # Should trigger xdg-open with upstream issue url with custom title
  git-new-issue "Custom message" upstream;
  assertEq "https://url.com/upstream-repo/issues/new?title=Custom message" "$mockLastOpenedUrl";

  mockLastOpenedUrl="";
  # Should return exit code 1, if repo was not found
  res=$(git-new-issue "" hello);
  assertEq "No remote url found for hello" "$res";
  assertEq "" "$mockLastOpenedUrl";
}


test "git-sync"; {
  assertEq "pull.origin.master" $(git-sync);
  assertEq "pull.origin.develop" $(git-sync develop);
  assertEq "pull.upstream.develop" $(git-sync develop upstream);
}

test "git-amend"; {
  assertEq "commit.--amend.--no-edit." $(git-amend);
  assertEq "commit.--amend.-m=My.message" $(git-amend "My message");
}

test "git-gh-pages"; {
  assertEq "subtree.push.--prefix.build.origin.gh-pages" $(git-gh-pages);
  assertEq "subtree.push.--prefix.dist.origin.gh-pages" $(git-gh-pages dist);
}

