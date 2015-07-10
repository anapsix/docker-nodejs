FROM anapsix/nodejs
MAINTAINER Anastas Dancha <anapsix@random.io>
ONBUILD RUN if [ -e ./deps.apk ]; then apk update && grep -v "^#\|^$" ./deps.apk | xargs apk add; else echo "no ./deps.apk file found, skipping dependecy installation"; fi
ONBUILD RUN if [ -x ./deps.sh ]; then ./deps.sh; else echo "no ./deps.sh file found, skipping script execution" >&2; fi
ONBUILD COPY package.json /app/
ONBUILD RUN cd /app && npm install
ONBUILD COPY . /app
CMD ["npm","start"]
