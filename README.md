# docker-minecraft-proxy

Lightweight Docker images for Minecraft proxy.

## Running

> **WARNING:** The following container is **ephemeral**, meaning any changes made to it will be discarded.

```shell
$ docker run --rm -it -p 25565:25577 cubxity/minecraft-proxy:velocity-adopt15
```

This image makes use of Aikar's flags by default. The data directory is located at `/data`.

## Environment variables

- `MEMORY` defaults to `1G`
- `INIT_MEMORY` Initial memory to allocate to the JVM. Defaults to `MEMORY`
- `MAX_MEMORY` Maximum memory to allocate to the JVM. Defaults to `MEMORY`

## Variants

> **WARNING:** Support for non-LTS runtime versions may be dropped at any point in time.

Images are based on adoptopenjdk's alpine images.

- **Velocity**: `velocity-{runtime}`, example: `velocity-adopt16`.