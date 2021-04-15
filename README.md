# docker-image-sculpin-serve

Docker images for generating and serving a [Sculpin static site](https://sculpin.io).

Inspired by [BretFisher/jekyll-serve](https://github.com/BretFisher/jekyll-serve).

## Usage

    # Install the site dependencies.
    docker run --rm -v $(pwd):/app composer composer install

    # Run a "sculpin" CLI command.
    docker run --rm -v $(pwd):/app opdavies/sculpin

    # Generate and serve the Sculpin site.
    docker run --rm -p 8000:8000 -v $(pwd):/app opdavies/sculpin-serve
