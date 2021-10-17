[![License](https://img.shields.io/github/license/Cubxity/docker-minecraft-proxy?style=flat-square)](LICENSE)
[![Issues](https://img.shields.io/github/issues/Cubxity/docker-minecraft-proxy?style=flat-square)](https://github.com/Cubxity/docker-minecraft-proxy/issues)
[![Discord](https://img.shields.io/badge/join-discord-blue?style=flat-square)](https://discord.gg/kDDhqJmPpA)

# docker-minecraft-proxy

Lightweight Docker/container images for Minecraft proxies.

## Running

> **WARNING:** The following container is **ephemeral**, meaning any changes made to it will be discarded.

```shell
$ docker run --rm -it -p 25565:25577 ghcr.io/cubxity/minecraft-proxy:velocity-java17-slim-bullseye
```

- `--rm` removes the container on exit
- `-i` keeps STDIN open
- `-t` allocates a pseudo-TTY
- `-p` publish port(s) to the host

This image makes use of Velocity's recommended flags by default. The data directory is located at `/data`.

## Environment variables

- `MEMORY` defaults to `1G`
- `INIT_MEMORY` Initial memory to allocate to the JVM. Defaults to `MEMORY`
- `MAX_MEMORY` Maximum memory to allocate to the JVM. Defaults to `MEMORY`
- `JVM_XX_OPTS` -XX JVM argument overrides
- `JVM_OPTS` JVM arguments to append

## Variants

This repository provides OpenJDK and Eclipse Temurin based container images for **Velocity**.

> **NOTE:** AdoptOpenJDK (`adopt*`) variants are **deprecated** in favor of OpenJDK and Temurin.
> Support for non-LTS versions may be dropped at any time.

### OpenJDK (`java*-slim-bullseye`)

Supports `linux/amd64` and `linux/arm64`.

This image is based on OpenJDK's Debian slim Bullseye image. The image format is suffixed
with `-java<version>-slim-bullseye`.

**Examples:**

- `velocity-java17-slim-bullseye`
- `velocity-3.0.1-java17-slim-bullseye`

### Eclipse Temurin Alpine (`temurin*-alpine`)

Supports `linux/amd64`.

This image is based on Eclipse Temurin's Alpine image. The image format is suffixed with `-temurin<version>-alpine`.

**Examples:**

- `velocity-temurin17-alpine`
- `velocity-3.0.1-temurin17-alpine`
