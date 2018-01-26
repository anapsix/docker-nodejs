FROM alpine:3.6
MAINTAINER Anastas Dancha <anapsix@random.io>
RUN apk -U upgrade \
 && apk add nodejs nodejs-npm ruby ruby-dev libffi-dev g++ make \
 && gem install sass --no-ri --no-rdoc \
 && apk del --purge ruby-dev libffi-dev g++ make
WORKDIR /app
