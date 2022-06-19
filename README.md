# siege

Latest version of [siege](https://github.com/JoeDog/siege) packaged as
a docker container.

    docker run -it --rm bermi/siege --help
    docker run -it --rm bermi/siege -c 2 -v -t 5S -d 1 example.com