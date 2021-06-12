#!/bin/sh

for flavor in velocity; do
  "./$flavor/build.sh"
done

docker push --all-tags cubxity/minecraft-proxy