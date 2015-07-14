FROM alpine:latest
MAINTAINER Anastas Dancha <anapsix@random.io>
RUN apk upgrade --update && apk add nodejs
WORKDIR /app
ADD install_deps.sh /install_deps.sh
ADD docker-entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
