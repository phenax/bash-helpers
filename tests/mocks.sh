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
    *)
      echo "Command not mocked yet";
    ;;
  esac
}
