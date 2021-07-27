#stage 1: compilation
FROM maven:openjdk as maven
WORKDIR /app
COPY . .
RUN mvn clean install -Dmaven.test.skip=true spring-boot:run
#stage 2: build container
FROM openjdk:11-jre-slim as javaf
WORKDIR /app
COPY --from=maven /app/target/backend-prueba1.0.0.jar .
ENTRYPOINT [ "java -jar ./backend-prueba1.0.0.jar $" ]