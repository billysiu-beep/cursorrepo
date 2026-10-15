#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

command -v git >/dev/null
command -v node >/dev/null
command -v npm >/dev/null

if [[ ! -f README.md ]]; then
  echo "README.md is missing" >&2
  exit 1
fi

if [[ -f package-lock.json ]]; then
  npm ci
elif [[ -f package.json ]]; then
  npm install
fi

if [[ -f requirements.txt ]]; then
  python3 -m pip install --user -r requirements.txt
fi

echo "cursorrepo environment install complete"
