# Etapa de build
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y

# Copia todo o código-fonte para a imagem
COPY . /app

# Define o diretório de trabalho
WORKDIR /app/teste-pratico

# Executa o build do Maven
RUN mvn clean install

# Etapa final
FROM openjdk:17-jdk-slim

EXPOSE 8080

# Copia o JAR gerado na etapa de build
COPY --from=build /app/teste-pratico/target/deploy_render-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
