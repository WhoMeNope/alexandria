FROM webdevops/php-apache:ubuntu-16.04

ENV PROVISION_CONTEXT "production"

# Deploy scripts/configurations
COPY etc/ /opt/docker/etc/

RUN ln -sf /opt/docker/etc/cron/crontab /etc/cron.d/docker-boilerplate \
    && chmod 0644 /opt/docker/etc/cron/crontab \
    && echo >> /opt/docker/etc/cron/crontab \
    && ln -sf /opt/docker/etc/php/production.ini /opt/docker/etc/php/php.ini

# Configure volume/workdir
WORKDIR /app/
