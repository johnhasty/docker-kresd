FROM alpine:edge
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="jhasty/kresd"
LABEL org.label-schema.description="Knot Resolver Docker Image"
LABEL org.label-schema.vcs-url="https://github.com/johnhasty/docker-kresd"
RUN apk add --update-cache --repository https://alpine.global.ssl.fastly.net/alpine/edge/community/ knot-resolver
COPY kresd.conf /etc/knot-resolver/kresd.conf
EXPOSE 53/tcp 53/udp
ENTRYPOINT ["/usr/sbin/kresd", "-c", "/etc/knot-resolver/kresd.conf", "-n"]
