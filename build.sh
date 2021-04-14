#!/usr/bin/env bash

docker image build . -t opdavies/sculpin --target sculpin
docker image build . -t opdavies/sculpin-serve --target sculpin-serve

docker image push opdavies/sculpin
docker image push opdavies/sculpin-serve