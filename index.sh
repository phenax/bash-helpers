#!/bin/bash

sourcePath=$BASH_SOURCE;

# Returns absolute directory of a file/dir path
absolute-dir() { echo $(dirname "$(realpath $1)"); }

# Import module with an absolute path
import-module() { source "$(absolute-dir $sourcePath)/$1"; }

import-module "utils.sh";
import-module "github.sh";
