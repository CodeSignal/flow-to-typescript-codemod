#!/usr/bin/env bash

set -e

file_name="CodeSignal/declarations/globals.d.ts"

cat << EOF > "$file_name"
export {};

declare global {
  const Assets: any;
  const CoffeeScript: any;
  const Future: any;
  const Iron: any;
  const HTTP: any;
  const Sass: any;
  const zE: any;

  // from node_modules
  type Long = any;
  type OffscreenCanvas = any;
}

EOF
