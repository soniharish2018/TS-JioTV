FROM php:8.3-cli

WORKDIR /app

COPY . .

EXPOSE 10000

CMD ["sh", "-c", "php -d opcache.enable=0 -d opcache.enable_cli=0 -S 0.0.0.0:${PORT:-10000}"]
