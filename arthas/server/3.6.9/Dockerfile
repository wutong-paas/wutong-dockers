FROM openjdk:8-jdk-alpine

# COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas
COPY arthas-tunnel-server-3.6.9-fatjar.jar /opt/arthas/arthas-tunnel-server.jar

ENTRYPOINT ["java", "-jar", "/opt/arthas/arthas-tunnel-server.jar"]