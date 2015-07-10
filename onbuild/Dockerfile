FROM anapsix/nodejs
MAINTAINER Anastas Dancha <anapsix@random.io>
WORKDIR /app
ONBUILD COPY package.json /app/
ONBUILD RUN npm install
ONBUILD COPY . /app
CMD ["npm","start"]
