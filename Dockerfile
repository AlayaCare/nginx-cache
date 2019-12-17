FROM nginx:stable

ENV INACTIVE 15m
ENV MAX_SIZE 20m

RUN apt-get update && \
    apt-get -y install tmpl dnsmasq && \
    rm -rf /var/lib/apt/lists/*

COPY nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl
ADD start.sh /usr/local/bin/
RUN mkdir -p /tmp/nginx/cache && chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
