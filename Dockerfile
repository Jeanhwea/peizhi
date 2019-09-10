FROM openjdk:8
LABEL appname="peizhi" author="Jinghui Hu"

COPY assets /assets
RUN chmod +x /assets/setup.sh && /assets/setup.sh

EXPOSE 8080
VOLUME /app/log

CMD /usr/sbin/startup.sh
