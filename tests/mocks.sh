#!/bin/bash

currentBranch="master";

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
            origin https://url.com/repo.git (hello)
            upstream https://url.com/upstream-repo.git (fetch)
            upstream https://url.com/upstream-repo.git (hello)
          ";
        ;;
        *)
          echo "remote";
        ;;
      esac
    ;;
    *)
      echo "Command not mocked yet";
    ;;
  esac
}
