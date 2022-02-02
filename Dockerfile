FROM php:7.4-cli-alpine AS sculpin

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ENV PATH=/app/bin:/app/vendor/bin:$PATH

WORKDIR /app

RUN adduser --disabled-password sculpin \
  && chown sculpin:sculpin -R /app

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

###

FROM sculpin AS sculpin-serve

CMD ["generate", "--server", "--watch"]
