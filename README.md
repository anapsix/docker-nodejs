# NodeJS in a box

Alpine Linux 3.6 Docker image with NodeJS v6.10.3

[![](https://badge.imagelayers.io/anapsix/nodejs:latest.svg)](https://imagelayers.io/?images=anapsix/nodejs:latest)

[![Build Status](https://travis-ci.org/anapsix/docker-nodejs.svg)](https://travis-ci.org/anapsix/docker-nodejs)

## Usage

It's assumed that you have working `./package.json` with resolvable dependencies and proper `start` script, so that `npm install` and `npm start` works.

- without building an image:

        docker run -it --rm \
          --name my-node-project \
          -p 5080:5080 \
          -v $(pwd):/app \
          anapsix/nodejs

> You should customize your _EXPOSE []_ according to `server.js`.  
> You can also add _ENTRYPOINT_, override _CMD_ and add dependencies as needed.

- building from `onbuild` tag:

        # Dockerfile
        FROM anapsix/nodejs:onbuild
        EXPOSE 5080

> To permanently install additional [AlpineLinux packages](http://pkgs.alpinelinux.org/packages), place one package name per line into `./deps.apk`.
> Applies to `latest` as well as `onbuild`.  
> For custom actions, create deps.sh executable script.  
> For **build-time only** dependencies (e.g. `bson` npm package requires `make` and `g++` to compile c++ extention), use `./deps_build.apk`.
> All packages will be installed before `npm install` and removed immediately after, for the sake of making resulting image smaller.
> Applies to `latest` as well as `onbuild`, except that `latest` will not cleanup the build-time dependencies.

NOTE:
- `latest` tries to resolve dependencies during `docker run`, before running `npm install && npm start` (assuming you did not override the `CMD`)
- `onbuild` resolves dependencies during `docker build`, cleans up build-time dependencies and the only command executed during `docker run` is `npm start` (assuming you did not override the `CMD`) 

## TODO

Add `./examples`
