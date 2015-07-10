# NodeJS in a box

AlpineLinux-base Docker image with NodeJS

[![](https://badge.imagelayers.io/anapsix/nodejs:latest.svg)](https://imagelayers.io/?images=anapsix/nodejs:latest)

## Usage

just-in-time:

    docker run -it --rm --name my-node-project -p 5080:5080 -v $(pwd):/app -w /app anapsix/nodejs

onbuild:

    # Dockerfile

