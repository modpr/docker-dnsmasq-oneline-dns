FROM alpine:3.17.2

RUN apk update && apk upgrade && \
    apk add bash dnsmasq && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENV DNSMASQ_ENTRY=""
ENTRYPOINT ["/entrypoint.sh"]
