#!/bin/bash

echo "cool";

import-module "../utils.sh";

assertEq "1" "1";
assertEq $(get-get-origin-url) "master";
