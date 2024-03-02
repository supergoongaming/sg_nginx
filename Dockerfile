FROM nginx:1.24-alpine

ARG script_location=/etc/periodic/15min/restart_nginx
COPY sites_available/ /etc/nginx/sites_available
RUN mkdir -p /etc/nginx/sites_enabled
COPY scripts/enable_sites.sh /tmp/enable_sites.sh
RUN chmod +x /tmp/enable_sites.sh && /tmp/enable_sites.sh
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY scripts/restart_nginx.sh $script_location
COPY scripts/startup.sh /usr/local/bin/startup.sh
RUN chmod +x /etc/periodic/ $script_location
RUN chmod +x /usr/local/bin/startup.sh
CMD ["/usr/local/bin/startup.sh"]