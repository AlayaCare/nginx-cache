FROM nginx:stable

ENV INACTIVE 15m
ENV MAX_SIZE 20m

RUN apt-get update && \
    apt-get -y install dnsmasq && \
    rm -rf /var/lib/apt/lists/*

COPY --from=hairyhenderson/gomplate:v3.6.0-slim /gomplate /usr/local/bin/gomplate

COPY nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl
ADD start.sh /usr/local/bin/
RUN mkdir -p /tmp/nginx/cache && chmod +x /usr/local/bin/start.sh

ENTRYPOINT [ "/usr/local/bin/start.sh" ]
CMD ["nginx", "-g", "daemon off;"]

