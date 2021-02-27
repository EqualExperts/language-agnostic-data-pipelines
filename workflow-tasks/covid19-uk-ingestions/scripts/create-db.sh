#!/bin/bash

set -e

DOCKER_POSTGRESQL_PATH=$(pwd)/tmp/docker/postgresql

# Create db path
echo "Creating directory at ${DOCKER_POSTGRESQL_PATH}"
mkdir -p "${DOCKER_POSTGRESQL_PATH}" && echo "DONE"

# Create db container
echo "Creating db container"
docker run \
  --name postgresql-covid \
  --interactive \
  --tty \
  --detach \
  --restart always \
  --publish 5433:5432 \
  --env 'POSTGRES_DB=covid19_dev' \
  --env 'POSTGRES_USER=covid_user' \
  --env 'POSTGRES_PASSWORD=covid_password' \
  --env 'PG_TRUST_LOCALNET=true' \
  --volume "${DOCKER_POSTGRESQL_PATH}":/var/lib/postgresql \
  postgres:11.9-alpine &&
  echo "DONE"
