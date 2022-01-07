#!/bin/sh

set -e

if ! [ -x "$(command -v npm)" ]; then
  echo 'Error: npm is not installed' >&2
  exit 1
fi

if ! [ -x "$(command -v pip3)" ]; then
  echo 'Error: pip3 is not installed' >&2
  exit 1
fi

git config core.hooksPath ".git-hooks"
chmod -R +x "$(git rev-parse --git-path hooks)"

cp "$(git rev-parse --git-path hooks)/paths.txt.example" "$(git rev-parse --git-path hooks)/paths.txt"
sed -i 's|HOME_DIR|'${HOME}'|' "$(git rev-parse --git-path hooks)/paths.txt"

npm install --global prettier
pip3 install --user yamllint
