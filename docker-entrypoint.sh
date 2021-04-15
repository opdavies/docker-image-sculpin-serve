#!/usr/bin/env sh

set -e

# Run "composer install" if there is no vendor directory.
[[ -d "vendor" ]] || composer install

sculpin $@