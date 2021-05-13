#!/bin/bash
declare -A runtimes
runtimes[adopt8]="adoptopenjdk/openjdk8:jre8u275-b01-alpine"
runtimes[adopt11]="adoptopenjdk/openjdk11:jre-11.0.9.1_1-alpine"
runtimes[adopt16]="adoptopenjdk/openjdk16:jre-16.0.1_9-alpine"

version="1.1.5"

for runtimeName in "${!runtimes[@]}"; do
  runtime="${runtimes[$runtimeName]}"
  mkdir -p "$runtimeName"

  sed \
    -e "s#__RUNTIME__#$runtime#" \
    -e "s/{RUNTIME_NAME}/$runtimeName/" \
    -e "s/{VELOCITY_VERSION}/$version/" \
    Dockerfile.template >"$runtimeName/Dockerfile"
done
