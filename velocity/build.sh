#!/bin/bash
declare -A runtimes
runtimes[adopt11]="adoptopenjdk/openjdk11:jre-11.0.10_9-alpine"
runtimes[adopt16]="adoptopenjdk/openjdk16:jre-16.0.1_9-alpine"

version=$(curl -s "https://nexus.velocitypowered.com/repository/maven-public/com/velocitypowered/velocity-native/maven-metadata.xml" | sed -n 's/.*<release>\([^<]*\)<\/release>/\1/p')

for runtimeName in "${!runtimes[@]}"; do
  echo "[velocity] building velocity-$version-$runtimeName"

  docker build \
    --build-arg "RUNTIME=${runtimes[$runtimeName]}" \
    --build-arg "RUNTIME_NAME=$runtimeName" \
    --build-arg "VELOCITY_VERSION=$version" \
    --tag "cubxity/minecraft-proxy:velocity-$version-$runtimeName" \
    --tag "cubxity/minecraft-proxy:velocity-$runtimeName" \
    -f velocity/Dockerfile \
    .
done
