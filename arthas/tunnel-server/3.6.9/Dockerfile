FROM openjdk:8-jdk-alpine

WORKDIR /opt/arthas

COPY arthas-tunnel-server-3.6.9-fatjar.jar arthas-tunnel-server.jar

ENTRYPOINT ["/bin/sh", "-c", "java -jar /opt/arthas/arthas-tunnel-server.jar"]