FROM openjdk:8
LABEL appname="peizhi" version="0.0.1" author="Jinghui Hu"

COPY assets /assets
RUN /assets/setup.sh

EXPOSE 8080
VOLUME /app/log

CMD /usr/sbin/startup.sh
