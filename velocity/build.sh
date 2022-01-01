#!/bin/bash
version=$(curl -s "https://nexus.velocitypowered.com/repository/maven-public/com/velocitypowered/velocity-native/maven-metadata.xml" | sed -n 's/.*<release>\([^<]*\)<\/release>/\1/p')

curl -s https://papermc.io/api/v2/projects/velocity/ | jq -r -c ".versions[]" | while read -r version; do
  build=$(curl -s "https://papermc.io/api/v2/projects/velocity/versions/$version" | jq -r ".builds[-1]")
  hash=$(curl -s "https://papermc.io/api/v2/projects/velocity/versions/$version/builds/$version" | jq -r ".downloads.application.sha256")

echo "[velocity] building velocity-$version-$build-$RUNTIME_NAME"

docker buildx build \
  --build-arg "RUNTIME=$RUNTIME_IMAGE" \
  --build-arg "RUNTIME_NAME=$RUNTIME_NAME" \
  --build-arg "VELOCITY_VERSION=$version" \
  --build-arg "VELOCITY_BUILD=$build" \
  --build-arg "VELOCITY_SHA256=$hash" \
  --tag "$REPOSITORY:velocity-$version-$RUNTIME_NAME" \
  --tag "$REPOSITORY:velocity-$RUNTIME_NAME" \
  --cache-from "type=registry,ref=$REPOSITORY:velocity-$version-$RUNTIME_NAME" \
  --cache-to "type=registry,ref=$REPOSITORY:velocity-$version-$RUNTIME_NAME,mode=max" \
  --file "velocity/$RUNTIME_OS/Dockerfile" \
  --platform "$RUNTIME_PLATFORM" \
  --push \
  . || exit 1
done