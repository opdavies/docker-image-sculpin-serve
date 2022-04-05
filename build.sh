#!/usr/bin/env bash

set -e

LATEST_PHP_VERSION="8.1"
SUPPORTED_PHP_VERSIONS=("8.1" "7.4")

SHOULD_PUSH=true

for PHP_VERSION in ${SUPPORTED_PHP_VERSIONS[@]}; do
  DOCKER_TAG="php-${PHP_VERSION}-alpine"

  docker image build . --build-arg=php_version=${PHP_VERSION} -t opdavies/sculpin:${DOCKER_TAG} --target sculpin
  docker image build . --build-arg=php_version=${PHP_VERSION} -t opdavies/sculpin-serve:${DOCKER_TAG} --target sculpin-serve

  docker image build . --build-arg=php_version=${PHP_VERSION} -t ghcr.io/opdavies/sculpin:${DOCKER_TAG} --target sculpin
  docker image build . --build-arg=php_version=${PHP_VERSION} -t ghcr.io/opdavies/sculpin-serve:${DOCKER_TAG} --target sculpin-serve

  if $SHOULD_PUSH; then
    docker image push opdavies/sculpin:${DOCKER_TAG}
    docker image push opdavies/sculpin-serve:${DOCKER_TAG}

    docker image push ghcr.io/opdavies/sculpin:${DOCKER_TAG}
    docker image push ghcr.io/opdavies/sculpin-serve:${DOCKER_TAG}
  fi

  if [[ $PHP_VERSION == $LATEST_PHP_VERSION ]]; then
    docker image build . --build-arg=php_version=${PHP_VERSION} -t opdavies/sculpin:latest --target sculpin
    docker image build . --build-arg=php_version=${PHP_VERSION} -t opdavies/sculpin-serve:latest --target sculpin-serve

    docker image build . --build-arg=php_version=${PHP_VERSION} -t ghcr.io/opdavies/sculpin:latest --target sculpin
    docker image build . --build-arg=php_version=${PHP_VERSION} -t ghcr.io/opdavies/sculpin-serve:latest --target sculpin-serve
  fi
done

if $SHOULD_PUSH; then
  docker image push opdavies/sculpin:latest
  docker image push opdavies/sculpin-serve:latest

  docker image push ghcr.io/opdavies/sculpin:latest
  docker image push ghcr.io/opdavies/sculpin-serve:latest
fi
