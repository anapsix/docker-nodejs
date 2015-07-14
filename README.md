# NodeJS in a box

AlpineLinux-base Docker image with NodeJS

[![](https://badge.imagelayers.io/anapsix/nodejs:latest.svg)](https://imagelayers.io/?images=anapsix/nodejs:latest)

## Usage

It's assumed that you have working `./package.json` with resolvable dependencies and proper `start` script, so that `npm install` and `npm start` works.

- without building an image:

        docker run -it --rm \
          --name my-node-project \
          -p 5080:5080 \
          -v $(pwd):/app \
          anapsix/nodejs

- building from `onbuild` tag:

        # Dockerfile
        FROM anapsix/nodejs:onbuild
        EXPOSE 5080

> You should customize your _EXPOSE []_ according to `server.js`.
> You can also add _ENTRYPOINT_, override _CMD_ and add dependencies as needed.

To install additional [AlpineLinux] packages, place one package name per line into `./deps.apk`.  
For custom actions, create deps.sh executable script.  
Both files are checked for in `latest` as well as `onbuild` images. The only difference, is that:
- `latest` tries to resolve dependencies during `docker run`, before running `npm install && npm start` (assuming you did not override the `CMD`)
- `onbuild` resolves dependencies during `docker build` and the only command executed during `docker run` is `npm start` (assuming you did not override the `CMD`) 


> For list of available packages see [http://pkgs.alpinelinux.org/packages](http://pkgs.alpinelinux.org/packages)
