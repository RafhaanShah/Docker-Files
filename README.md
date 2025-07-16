# Docker Files

Docker files for stuff I use.

## Setup:

- Update `daemon.json`: `mkdir -p ~/.config/docker; cp daemon.json ~/.config/docker/daemon.json`
- Create external network: `docker network create docker`

## Build and Run

- Start: `docker compose up -d`
- Stop and remove: `docker compose down`
- Build and start: `docker compose up --build -d`
- Update and start: `docker compose pull && docker compose up -d`

## Validate and Format

- `git ls-files '*.yml' | xargs yamllint`
- `git ls-files '*.yml' | xargs prettier --write --no-bracket-spacing`
