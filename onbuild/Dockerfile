FROM anapsix/nodejs
MAINTAINER Anastas Dancha <anapsix@random.io>
ONBUILD COPY . /app
ONBUILD RUN /install_deps.sh && cd /app && npm install && /cleanup_deps.sh
CMD ["npm","start"]
