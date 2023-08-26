FROM nginx:1.24-alpine
COPY sites_available/ /etc/nginx/sites_available
RUN mkdir -p /etc/nginx/sites_enabled
COPY ./enable_sites.sh /tmp/enable_sites.sh
RUN chmod +x /tmp/enable_sites.sh && /tmp/enable_sites.sh
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY restart_nginx.sh /usr/local/bin/restart_nginx.sh
RUN chmod +x /usr/local/bin/restart_nginx.sh
RUN apk add --no-cache dcron
RUN echo "0 0 * * * /usr/local/bin/restart_nginx.sh" >> /etc/crontabs/root
CMD ["crond", "-f"]