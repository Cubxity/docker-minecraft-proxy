# docker-minecraft-proxy

Lightweight Docker images for Minecraft proxy.

## Running

> **WARNING:** The following container is **ephemeral**, meaning any changes made to it will be discarded.

```shell
$ docker run --rm -it -p 25565:25577 cubxity/minecraft-proxy:velocity-adopt16
```

This image makes use of Aikar's flags by default. The data directory is located at `/data`.

## Environment variables

- `MEMORY` defaults to `1G`
- `INIT_MEMORY` Initial memory to allocate to the JVM. Defaults to `MEMORY`
- `MAX_MEMORY` Maximum memory to allocate to the JVM. Defaults to `MEMORY`

## Variants

> **NOTE:** AdoptOpenJDK 8 & 15 variants are deprecated. Support Non-LTS versions may be dropped at any time.

Images are based on AdoptOpenJDK's alpine images.

- **Velocity**: `velocity-{runtime}`, `velocity-{version}-{runtime}`, example: `velocity-adopt16`, `velocity-1.1.8-adopt16`.