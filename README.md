# Docker Files

Docker files for stuff I use.

## Setup:

- Update `daemon.json`: `mkdir -p ~/.config/docker; cp daemon.json ~/.config/docker/daemon.json`
- Create external network: `docker network create docker`

## Validate and Format

- `git ls-files '*.yml' | xargs yamllint`
- `git ls-files '*.yml' | xargs prettier --write --no-bracket-spacing`
