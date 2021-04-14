# docker-image-sculpin-serve

A Docker image for installing dependencies for a [Sculpin-generated static site](https://sculpin.io) and serving it using Sculpin's `generate` command.

## Usage

    docker run -p 8000:8000 -v $(pwd):/app opdavies/sculpin-serve
