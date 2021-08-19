#!/usr/bin/env bash

# Docker Hub
docker image build . -t opdavies/sculpin --target sculpin
docker image build . -t opdavies/sculpin-serve --target sculpin-serve
docker image push opdavies/sculpin
docker image push opdavies/sculpin-serve

# GitHub
docker image build . -t ghcr.io/opdavies/sculpin --target sculpin
docker image build . -t ghcr.io/opdavies/sculpin-serve --target sculpin-serve
docker image push ghcr.io/opdavies/sculpin
docker image push ghcr.io/opdavies/sculpin-serve
