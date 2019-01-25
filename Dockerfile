FROM nginx:stable

COPY nginx.conf /etc/nginx/conf.d/cache.conf.template
ADD start.sh /usr/local/bin/
RUN mkdir -p /tmp/nginx/cache && chmod +x /usr/local/bin/start.sh

ENTRYPOINT [ "/usr/local/bin/start.sh" ]
