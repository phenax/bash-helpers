#!/bin/bash

currentBranch="master";
mockLastOpenedUrl="";

reset-mocks() {
  currentBranch="master";
  mockLastOpenedUrl="";
}

git() {
  case "$1" in
    status)
      echo "
        On branch $currentBranch
        Hello world
      ";
    ;;
    checkout)
      currentBranch="$2";
      echo "Switched to new branch $currentBranch";
    ;;
    remote)
      case "$2" in
        -v)
          echo "
            origin https://url.com/repo.git (fetch)
            origin https://url.com/repo.git (wow)
            upstream https://url.com/upstream-repo.git (fetch)
            upstream https://url.com/upstream-repo.git (wow)
          ";
        ;;
        *)
          echo "remote";
        ;;
      esac
    ;;
    commit)
      echo "$1.$2.$3.$4";
    ;;
    pull)
      echo "$1.$2.$3";
    ;;
    subtree)
      echo "$1.$2.$3.$4.$5.$6";
    ;;
    *)
      echo "Command not mocked yet";
    ;;
  esac
}

xdg-open() {
  mockLastOpenedUrl="$1";
}
