FROM openjdk:8
LABEL appname="peizhi" version="0.0.1" author="Jinghui Hu"
COPY target/peizhi-0.0.1.jar /app/peizhi.jar
WORKDIR /app
EXPOSE 8080
VOLUME /app/log
CMD java -jar peizhi.jar
