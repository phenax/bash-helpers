
# Import module with an absolute path
import-module() {
  source "$(dirname "$(realpath $0)")/$1";
}

echo "Wow";
