FROM openjdk:8
LABEL appname="peizhi" author="Jinghui Hu"

COPY assets /app
RUN chmod +x /app/setup.sh && /app/setup.sh

EXPOSE 9000
VOLUME /app/log
VOLUME /app/git

ENTRYPOINT /usr/sbin/startup.sh
