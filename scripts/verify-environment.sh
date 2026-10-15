#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

readme="$(cat README.md)"
if [[ "$readme" != "# cursorrepo" ]]; then
  echo "Unexpected README content" >&2
  exit 1
fi

node -e "
const fs = require('fs');
const report = {
  readme: fs.readFileSync('README.md', 'utf8').trim(),
  node: process.version,
  platform: process.platform,
};
console.log(JSON.stringify(report, null, 2));
"

echo "Environment verification passed"
