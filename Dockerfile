FROM php:8.3-cli

# 1. Install necessary system dependencies for curl transport operations
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Build and activate the native PHP curl engine extension
RUN docker-php-ext-install curl

# 3. Mount workspace application target root
WORKDIR /app

# 4. Pull your project tree elements over to the workspace image boundary
COPY . .

# 5. Render expects Web Services to accept structural binds across port 10000 by default 
EXPOSE 10000

# 6. Execute server matching Render's required dynamic environmental variable binding
CMD ["sh", "-c", "php -d opcache.enable=0 -d opcache.enable_cli=0 -S 0.0.0.0:${PORT:-10000}"]
