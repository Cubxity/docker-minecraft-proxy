#!/bin/bash
declare -A runtimes
runtimes[adopt8]="adoptopenjdk/openjdk8:alpine-jre"
runtimes[adopt11]="adoptopenjdk/openjdk11:alpine-jre"
runtimes[adopt15]="adoptopenjdk/openjdk15:alpine-jre"

version="1.1.4"

for runtimeName in "${!runtimes[@]}"; do
  runtime="${runtimes[$runtimeName]}"
  mkdir -p "$runtimeName"

  sed \
    -e "s#__RUNTIME__#$runtime#" \
    -e "s/{RUNTIME_NAME}/$runtimeName/" \
    -e "s/{VELOCITY_VERSION}/$version/" \
    Dockerfile.template >"$runtimeName/Dockerfile"
done
