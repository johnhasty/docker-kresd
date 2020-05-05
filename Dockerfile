FROM alpine:edge
RUN apk add --update-cache --repository https://alpine.global.ssl.fastly.net/alpine/edge/community/ knot-resolver
COPY kresd.conf /etc/knot-resolver/kresd.conf
EXPOSE 53/tcp 53/udp
ENTRYPOINT ["/usr/sbin/kresd", "-c", "/etc/knot-resolver/kresd.conf", "-n"]
