#!/bin/sh

umask 0002
chmod g+w /data

# Copy content from /run/data/ to /data/.
# This is useful for mounting read-only filesystem such as ConfigMaps in Kubernetes.
if [ -d /run/data ]; then
   cp -rf /run/data/ /
fi

# Environment variables
INIT_MEMORY=${INIT_MEMORY:=${MEMORY}}
MAX_MEMORY=${MAX_MEMORY:=${MEMORY}}

JVM_XX_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"
JVM_OPTS="-Xms$INIT_MEMORY -Xmx$MAX_MEMORY ${JVM_OPTS}"
D_OPTS="${D_OPTS}"

# Start the server
# shellcheck disable=SC2086 disable=SC2068
exec java $JVM_XX_OPTS $JVM_OPTS $D_OPTS -jar /server.jar $@
