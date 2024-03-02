FROM nginx:1.24-alpine
COPY sites_available/ /etc/nginx/sites_available
RUN mkdir -p /etc/nginx/sites_enabled
COPY scripts/enable_sites.sh /tmp/enable_sites.sh
RUN chmod +x /tmp/enable_sites.sh && /tmp/enable_sites.sh
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY scripts/restart_nginx.sh /etc/periodic/15min/restart_nginx
RUN chmod +x /usr/local/bin/restart_nginx.sh
RUN dcron