ARG RUNTIME
ARG RUNTIME_NAME

FROM $RUNTIME

LABEL org.opencontainers.image.documentation="https://github.com/Cubxity/docker-minecraft-proxy"
LABEL org.opencontainers.image.authors="Cubxity <cubxity@protonmail.com>"
LABEL org.opencontainers.image.source="https://github.com/Cubxity/docker-minecraft-proxy"
LABEL org.opencontainers.image.version="velocity-$VELOCITY_VERSION-$RUNTIME_NAME"

ARG VELOCITY_VERSION

RUN groupadd -g 1000 minecraft \
  && useradd -r -s /bin/false -u 1000 -g 1000 -m minecraft \
  && mkdir -m 775 /data \
  && chown minecraft:minecraft /data \
  && apt-get update && apt-get install -y curl \
  && curl -sfL -o /server.jar "https://versions.velocitypowered.com/download/$VELOCITY_VERSION.jar"

COPY bin/start.sh /start.sh

ENV MEMORY="1G"

WORKDIR /data
ENTRYPOINT [ "/start.sh" ]

USER minecraft
EXPOSE 25577