#!/bin/sh

set -e

git config core.hooksPath ".git-hooks"
chmod -R +x "$(git rev-parse --git-path hooks)"
