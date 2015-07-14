FROM anapsix/nodejs
MAINTAINER Anastas Dancha <anapsix@random.io>
ONBUILD COPY . /app
ONBUILD RUN if [ -e ./deps.apk ]; then apk update && grep -v "^#\|^$" ./deps.apk | xargs apk add; else echo "no ./deps.apk file found, skipping dependecy installation"; fi
ONBUILD RUN if [ -x ./deps.sh ]; then ./deps.sh; else echo "no ./deps.sh file found, skipping script execution" >&2; fi
ONBUILD RUN cd /app && npm install
CMD ["npm","start"]
