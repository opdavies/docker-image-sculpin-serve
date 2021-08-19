#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  sha=$1
else
  sha=latest
fi

# Docker Hub
docker image build . -t opdavies/sculpin:$sha --target sculpin
docker image build . -t opdavies/sculpin-serve:$sha --target sculpin-serve
docker image push opdavies/sculpin:$sha
docker image push opdavies/sculpin-serve:$sha

# GitHub
docker image build . -t ghcr.io/opdavies/sculpin:$sha --target sculpin
docker image build . -t ghcr.io/opdavies/sculpin-serve:$sha --target sculpin-serve
docker image push ghcr.io/opdavies/sculpin:$sha
docker image push ghcr.io/opdavies/sculpin-serve:$sha
