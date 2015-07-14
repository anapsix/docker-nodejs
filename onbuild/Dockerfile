FROM anapsix/nodejs
MAINTAINER Anastas Dancha <anapsix@random.io>
ONBUILD COPY . /app
ONBUILD RUN /install_deps.sh
ONBUILD RUN cd /app && npm install
CMD ["npm","start"]
