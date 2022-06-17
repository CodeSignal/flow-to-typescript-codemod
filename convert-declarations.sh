#!/usr/bin/env bash

set -e

cd CodeSignal || exit

rm imports/declarations/utilityTypes.ts

files=( $(ls imports/declarations) )

for file in "${files[@]}"
do
  file_path="imports/declarations/$file"
  sed -i '' 's/export//g' "$file_path"
  content=$(cat "${file_path}")

cat << EOF > "$file_path"
export {};

declare global {
${content}
}
EOF

  git mv "$file_path" "${file_path::${#file_path}-2}d.ts"
done
