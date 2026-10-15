#!/usr/bin/env bash
# Package the library the same way make_release.ps1 does, as a zip that the
# Arduino IDE "Add .ZIP Library" accepts: a single top-level folder named
# dcs-bios-arduino-library-<version>/ containing examples, src, keywords.txt,
# library.properties, LICENSE and the markdown files.
#
# Usage: scripts/make_release.sh [version] [output-dir]
#   version     defaults to the version in library.properties
#   output-dir  defaults to ./Releases
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

props_version="$(sed -n 's/^version=//p' library.properties | tr -d '\r')"
version="${1:-$props_version}"
out_dir="${2:-Releases}"

if [[ -z "$version" ]]; then
    echo "error: could not read version from library.properties" >&2
    exit 1
fi
if [[ "$version" != "$props_version" ]]; then
    echo "error: requested version $version does not match library.properties ($props_version)" >&2
    exit 1
fi

name="dcs-bios-arduino-library-$version"
stage="$out_dir/$name"
zip_path="$out_dir/$name.zip"

rm -rf "$stage" "$zip_path"
mkdir -p "$stage"

cp -R examples src "$stage/"
cp keywords.txt library.properties LICENSE ./*.md "$stage/"

# Never ship editor/OS droppings (src/.DS_Store is tracked in git).
find "$stage" \( -name '.DS_Store' -o -name 'Thumbs.db' \) -delete

(cd "$out_dir" && zip -q -r -X "$name.zip" "$name")

echo "created $zip_path"
unzip -l "$zip_path" | tail -n 1
