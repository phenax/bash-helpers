#!/bin/bash

# Returns absolute directory of a file/dir path
absolute-dir() { echo $(dirname "$(realpath $1)"); }

# Import module with an absolute path
import-module() { source "$(absolute-dir $0)/$1"; }

import-module "github.sh";
