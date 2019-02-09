#!/bin/bash

import-module "utils.sh";

echo "$(git-get-branch-name)";
echo "$(git-get-remote-url)";
