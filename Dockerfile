FROM nginx:stable

ENV INACTIVE 15m
ENV MAX_SIZE 20m

COPY nginx.conf /etc/nginx/nginx.conf.template
ADD start.sh /usr/local/bin/
RUN mkdir -p /tmp/nginx/cache && chmod +x /usr/local/bin/start.sh

ENTRYPOINT [ "/usr/local/bin/start.sh" ]
CMD ["nginx", "-g", "daemon off;"]

