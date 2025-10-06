FROM nginxinc/nginx-unprivileged:1-alpine


COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./gunicorn_headers /etc/nginx/gunicorn_headers
COPY ./scripts/run.sh /run.sh



ENV PROXY_LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN mkdir -p /vol/static && \
    mkdir -p /vol/media && \
    chmod 755 /vol && \
    touch /etc/nginx/conf.d/default.conf && \
    chown -R nginx:nginx /vol/static /vol/media && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

USER nginx

VOLUME /vol/static
VOLUME /vol/media

CMD ["/run.sh"]
