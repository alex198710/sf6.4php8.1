FROM node:20-slim AS node
FROM php:8.1-fpm

RUN apt-get -y update
RUN apt-get -y install git rsync

COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
