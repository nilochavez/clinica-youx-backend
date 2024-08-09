FROM ubuntu:latest AS build

# Definir o diretório de trabalho
WORKDIR /app

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y

# Copiar todos os arquivos para o diretório de trabalho
COPY . .

# Executar o Maven no diretório onde o pom.xml está localizado
RUN mvn clean install

FROM openjdk:17-jdk-slim

EXPOSE 8080

# Copiar o arquivo jar gerado para a segunda imagem
COPY --from=build /app/target/deploy_render-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
