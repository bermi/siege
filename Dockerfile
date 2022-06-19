FROM bitnami/minideb:bullseye

RUN apt-get update && \
  apt-get install -y wget zip && \
  apt-get install -y --no-install-recommends build-essential openssl autoconf automake zlib1g zlib1g-dev && \
  wget https://github.com/JoeDog/siege/archive/refs/heads/master.zip && \
  unzip master.zip && \
  cd siege-master && \
  ./utils/bootstrap && \
  ./configure && \
  make && \
  make install && \
  cd ../ && \
  rm -rf siege-master master.zip && \
  apt-get purge --allow-remove-essential -y wget zip autoconf automake build-essential && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  siege -h && \
  useradd -m -s /bin/sh app

USER app
WORKDIR /home/app/

ENTRYPOINT [ "siege" ]
