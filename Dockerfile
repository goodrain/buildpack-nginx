FROM debian:stretch-slim

ENV TZ=Asia/Shanghai
ENV PCRE_VERSION=8.42
ENV ZLIB_VERSION=1.2.11
ENV OPENSSL_VERSION=1.1.0j
ENV NGINX_VERSION=1.14.2
ENV BUILD_DIR=/app/nginx
ENV DOWNLOAD_URL=https://dl.spanda.io/linux/nginx

RUN mkdir -p $BUILD_DIR \
    && apt-get update \
    && apt-get install -y --no-install-recommends  build-essential curl

RUN set -x \
    && curl -sk https://ftp.pcre.org/pub/pcre/pcre-$PCRE_VERSION.tar.gz | tar xz -C /tmp/ \
    && curl -sk https://zlib.net/zlib-$ZLIB_VERSION.tar.gz | tar xz -C /tmp/ \
    && curl -sk https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz | tar xz -C /tmp/ \
    && curl -sk http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz | tar xz -C /tmp/

VOLUME /opt/package

COPY build.sh /

CMD ["/build.sh"]