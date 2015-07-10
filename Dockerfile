FROM alpine:latest
MAINTAINER Anastas Dancha <anapsix@random.io>
RUN apk upgrade --update && apk add nodejs
WORKDIR /app
CMD npm install && npm start
