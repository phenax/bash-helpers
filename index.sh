#!/bin/bash

# Import module with an absolute path
import-module() {
  source "$(dirname "$(realpath $0)")/$1";
}

import-module "github.sh";
