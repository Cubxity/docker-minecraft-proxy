#!/bin/bash
IMAGE_NAME="cubxity/minecraft-proxy"

for variant in */; do
  variant=${variant%*/}

  tag="$IMAGE_NAME:velocity-$variant"
  docker build -t "$tag" -f "${variant}/Dockerfile" .
  docker push "$tag"
done
