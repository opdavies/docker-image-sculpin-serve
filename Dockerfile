FROM php:7.4-cli-alpine

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ENV PATH=/app/bin:/app/vendor/bin:$PATH

WORKDIR /app

CMD ["sculpin", "generate", "--server", "--watch"]
