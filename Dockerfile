FROM alpine:latest
MAINTAINER Anastas Dancha <anapsix@random.io>

RUN apk upgrade --update && apk add nodejs

ONBUILD COPY package.json /app/
ONBUILD RUN npm install
ONBUILD COPY . /app

CMD ["npm","start"]
