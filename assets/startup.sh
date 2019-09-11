#!/bin/bash

if [ "$USE_GIT_REPOSITORY" == true ]; then
  if [ "$URI" != "" ]; then
    ARGS="-Dspring.cloud.config.server.git.uri=$URI"${ARGS:+" $ARGS"}
  fi

  if [ "$USERNAME" != "" ]; then
    ARGS="-Dspring.cloud.config.server.git.username=$USERNAME"${ARGS:+" $ARGS"}
  fi

  if [ "$PASSWORD" != "" ]; then
    ARGS="-Dspring.cloud.config.server.git.password=$PASSWORD"${ARGS:+" $ARGS"}
  fi

  if [ "$SEARCH" != "" ]; then
    ARGS="-Dspring.cloud.config.server.git.searchPaths=$SEARCH"${ARGS:+" $ARGS"}
  fi
else
  ARGS="-Dspring.cloud.config.server.git.uri=file:///app/git"${ARGS:+" $ARGS"}
fi

if [ -f /app/app.jar ]; then
  cd /app && java -jar $ARGS app.jar
else
  echo "failed to run [java -jar $ARGS app.jar]"
fi
