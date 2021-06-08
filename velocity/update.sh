#!/bin/bash
declare -A runtimes
runtimes[adopt16]="adoptopenjdk/openjdk16:jre-16.0.1_9-alpine"

version="1.1.7"

for runtimeName in "${!runtimes[@]}"; do
  runtime="${runtimes[$runtimeName]}"
  mkdir -p "$runtimeName"

  sed \
    -e "s#__RUNTIME__#$runtime#" \
    -e "s/{RUNTIME_NAME}/$runtimeName/" \
    -e "s/{VELOCITY_VERSION}/$version/" \
    Dockerfile.template >"$runtimeName/Dockerfile"
done
