FROM eclipse-temurin:26-jdk

RUN apt-get update \
    && apt-get install -y curl ca-certificates tzdata bash \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/container container

USER container
ENV USER=container
ENV HOME=/home/container

WORKDIR /home/container

CMD ["/bin/bash"]