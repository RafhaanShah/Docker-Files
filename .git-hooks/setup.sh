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

hooks_dir=".git-hooks"
if ! [ -d "${hooks_dir}" ]; then
  echo "Error: run this from the root directory:\n.git-hooks/setup.sh"
  exit 1
fi

git config core.hooksPath "${hooks_dir}"
chmod -R +x "${hooks_dir}"
echo "Set git hooks path:"
git rev-parse --git-path hooks

npm install --global prettier
pip3 install --user yamllint
