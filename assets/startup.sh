#!/bin/bash

if [ "$URI" != "" ]; then
  ARGS="-Dspring.cloud.config.server.git.uri=$URI"${ARGS:+" $ARGS"}
fi

if [ "$USERNAME" != "" ]; then
  ARGS="-Dspring.cloud.config.server.git.username=$USERNAME"${ARGS:+" $ARGS"}
fi

if [ "$PASSWORD" != "" ]; then
  ARGS="-Dspring.cloud.config.server.git.password=$PASSWORD"${ARGS:+" $ARGS"}
fi

if [ -f /app/app.jar ]; then
  cd /app && java -jar app.jar $ARGS
else
  echo 'failed to starting app'
fi
