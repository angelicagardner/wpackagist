# Experimental Dockerfile for local dev use.

FROM php:7.4-apache

# Install svn client, a requirement for the current native exec approach, and git+unzip to clone
# the Composer performance-helping plugin below.
RUN apt-get update -qq && \
    apt-get install -y git subversion unzip && \
    rm -rf /var/lib/apt/lists/* /var/cache/apk/*

# Get latest Composer & parallel install plugin prestissimo.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo
