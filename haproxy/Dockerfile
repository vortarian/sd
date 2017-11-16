FROM alpine:3.6

ENV CONSUL_TEMPLATE_VERSION=0.19.3

# Update wget to get support for SSL
RUN apk --update add haproxy \
  && apk --purge -v del

ADD consul-template.tar.gz /usr/bin

COPY consul-template /consul-template/

ENTRYPOINT ["consul-template"]
CMD  ["-config=/consul-template/haproxy.json"]
