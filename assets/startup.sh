#!/bin/bash

if [ "$URI" != "" ]; then
  ARGS="-Dspring.cloud.config.uri=$URI"${ARGS:+" $ARGS"}
fi

if [ "$USERNAME" != "" ]; then
  ARGS="-Dspring.cloud.config.username=$USERNAME"${ARGS:+" $ARGS"}
fi

if [ "$PASSWORD" != "" ]; then
  ARGS="-Dspring.cloud.config.password=$PASSWORD"${ARGS:+" $ARGS"}
fi

if [ -f /app/app.jar ]; then
  cd /app && java -jar app.jar $ARGS
else
  echo 'failed to starting app'
fi
