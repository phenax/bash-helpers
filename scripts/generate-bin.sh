#!/bin/bash

# Get the script contents
get-script-contents() {
  echo "#!/bin/bash

source \"\$(dirname \"\$0\")/../index.sh\";
$1 \"\$@\";
";
}

# Generate binaries from the .exports config file
generate-bins() {
  mkdir -p ../bin;

  while read x; do
    if [[ "$x" == "" ]]; then :
    else
      local scriptPath=./bin/$x;
      get-script-contents $x > $scriptPath;
      chmod +x $scriptPath;
    fi;
  done;
}

cat ./.exports | generate-bins
