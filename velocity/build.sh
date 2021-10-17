#!/bin/bash
version=$(curl -s "https://nexus.velocitypowered.com/repository/maven-public/com/velocitypowered/velocity-native/maven-metadata.xml" | sed -n 's/.*<release>\([^<]*\)<\/release>/\1/p')

echo "[velocity] building velocity-$version-$RUNTIME_NAME"

docker buildx build \
  --build-arg "RUNTIME=$RUNTIME_IMAGE" \
  --build-arg "RUNTIME_NAME=$RUNTIME_NAME" \
  --build-arg "VELOCITY_VERSION=$version" \
  --tag "$REPOSITORY:velocity-$version-$RUNTIME_NAME" \
  --tag "$REPOSITORY:velocity-$RUNTIME_NAME" \
  --cache-from "type=registry,ref=$REPOSITORY:velocity-$version-$RUNTIME_NAME" \
  --cache-to "type=registry,ref=$REPOSITORY:velocity-$version-$RUNTIME_NAME,mode=max" \
  --file "velocity/$RUNTIME_OS/Dockerfile" \
  --platform "$RUNTIME_PLATFORM" \
  --push \
  . || exit 1