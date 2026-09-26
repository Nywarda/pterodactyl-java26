FROM eclipse-temurin:26-jdk

LABEL author="Nywarda"
LABEL org.opencontainers.image.source="https://github.com/Nywarda/pterodactyl-java26"

RUN apt-get update -y \
    && apt-get install -y \
        lsof \
        curl \
        ca-certificates \
        openssl \
        git \
        tar \
        sqlite3 \
        fontconfig \
        libfreetype6 \
        tzdata \
        iproute2 \
        libstdc++6 \
    && useradd -d /home/container -m container \
    && rm -rf /var/lib/apt/lists/*

USER container

ENV USER=container
ENV HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]