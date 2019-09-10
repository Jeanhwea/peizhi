#!/usr/bin/env bash
if [ "$REPOURI" != "" ]; then
  ARGS="-Dspring.cloud.config.uri=$REPOURI"${ARGS:+" $ARGS"}
fi

if [ "$USERNAME" != "" ]; then
  ARGS="-Dspring.cloud.config.username=$USERNAME"${ARGS:+" $ARGS"}
fi

if [ "$PASSWORD" != "" ]; then
  ARGS="-Dspring.cloud.config.password=$PASSWORD"${ARGS:+" $ARGS"}
fi

if [ -f /app/app.jar ]; then
  cd /app && java -jar $ARGS app.jar
else
  echo 'failed to starting app'
fi
