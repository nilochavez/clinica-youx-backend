# Etapa de build
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . /app

WORKDIR /app/teste-pratico

RUN apt-get install maven -y
RUN mvn clean install

# Etapa de produção
FROM openjdk:17-jdk-slim

EXPOSE 8080

# Copia o JAR gerado na etapa de build
COPY --from=build /app/teste-pratico/target/teste-pratico-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
