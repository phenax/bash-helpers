#!/bin/bash

echo "cool";

import-module "../utils.sh";

assertEq "wow" "master";
