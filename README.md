# Teste Prático

Este projeto é uma aplicação desenvolvida com Java Spring Boot e Angular 17 para gerenciamento de pacientes. A aplicação utiliza PostgreSQL para o banco de dados e inclui autenticação e autorização com Spring Security.

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- [Java JDK 17](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
- [Maven](https://maven.apache.org/download.cgi)
- [PostgreSQL](https://www.postgresql.org/download/)

## Configuração do Banco de Dados

### 1. Configuração Local

1. **Instale o PostgreSQL**: Se ainda não o fez, instale o PostgreSQL em sua máquina.
   
2. **Crie um Banco de Dados**: Utilize o comando psql para importar o arquivo backup.banco para o seu banco de dados:<br>
psql -U seu_usuario -d seu_banco_de_dados -f path/para/backup.banco


3. **Configure a Conexão do Banco de Dados**: Atualize as configurações de conexão no arquivo `src/main/resources/application.properties` com suas credenciais PostgreSQL:

   ```properties
   spring.datasource.url=jdbc:postgresql://localhost/pg_clinica
   spring.datasource.username=postgres
   spring.datasource.password=root
   spring.flyway.baseline-on-migrate=true

### 4. Configuração Local
1. **Clonar o Repositório**
Clone o repositório para sua máquina local:


Copiar código
git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
cd SEU_REPOSITORIO
2. **Construir e Executar a Aplicação**
Navegue até o diretório do projeto e execute os seguintes comandos:


Copiar código
./mvnw clean install
./mvnw spring-boot:run
Se estiver usando Windows, substitua ./mvnw por mvnw.cmd.

5. ##Executar a Aplicação Frontend (Angular)
Certifique-se de que o backend está em execução. Em um novo terminal, navegue até o diretório do frontend e execute:

bash
Copiar código
npm install
ng serve
O frontend estará disponível em http://localhost:4200.

Configuração de Usuários e Permissões
A aplicação está configurada com dois tipos de usuários:

Usuário Admin (Médico)<br>

Nome de Usuário: admin<br>
Senha: admin<br>
Permissões: Acesso total, incluindo criação, edição e exclusão de pacientes.<br>

Usuario Enfermeiro:<br>
Nome de Usuário: user<br>
Senha: us
Permissões: Acesso limitado, pode cadastrar novos pacientes.<br>

**Testar a Aplicação**<br>
Baixar e importar os arquivos quem tem os endpoints no postman para testar.<br>

Acesse a aplicação no navegador em http://localhost:8080 para o backend e http://localhost:4200 para o frontend.<br>
Faça login com as credenciais fornecidas para verificar o acesso e permissões.<br>
Troubleshooting<br>
Erro ao Conectar ao Banco de Dados:<br>

Verifique se o PostgreSQL está em execução.<br>
Confirme as credenciais e URL do banco de dados no application.properties.<br>
Problemas ao Importar o Banco de Dados:<br>

Verifique se o arquivo backup.banco está no formato correto.<br>
Certifique-se de que você tem permissões adequadas para importar dados no banco de dados.<br>
Problemas ao Construir o Projeto:<br>

Verifique se você tem o Maven corretamente instalado e configurado.

Certifique-se de que todas as dependências estão corretamente definidas no pom.xml.

# Documentação da Rotas da APi - 

A seguir estão as rotas disponíveis na API da Clínica YOUX Backend para gerenciar pacientes, juntamente com exemplos de requisições e os dados necessários.




Documentação das Rotas da API - Clínica YOUX Backend
A seguir estão as rotas disponíveis na API da Clínica YOUX Backend para gerenciar pacientes, juntamente com exemplos de requisições e os dados necessários.<br>
Foi realizdo deploy no servidor [Render](https://render.com/)
.
<br>
**Listar Pacientes**<br>:
Método: GET<br>
URL: https://clinica-youx-backend.onrender.com/pacientes
URL: localhost:8080/login
Descrição: Esta rota retorna uma lista de todos os pacientes cadastrados no sistema.<br>

**Criar Paciente** <br>
Método: POST <br>
URL: https://clinica-youx-backend.onrender.com/pacientes<br>
URL: https:localhost:8080/pacientes<br>

Descrição: Esta rota cria um novo paciente no sistema.<br>
Corpo da Requisição (JSON):<br>
 ```
{
    "nome": "Nilo",
    "cpf": "045787878787",
    "dataNascimento": "1990-05-15",
    "peso": 70.5,
    "altura": 1.80,
    "uf": "RS"
}

 ```

**Atualizar Paciente** <br>
Método: PUT <br>
URL: https://clinica-youx-backend.onrender.com/pacientes<br>
URL: https:localhost:8080/pacientes<br>

Descrição: Esta rota cria um novo paciente no sistema.<br>
Autenticação: Necessário passar o Bearer token de autenticação.

Corpo da Requisição (JSON):<br>
 ```
{
    "nome": "Nilo",
    "cpf": "045787878787",
    "dataNascimento": "1990-05-15",
    "peso": 70.5,
    "altura": 1.80,
    "uf": "RS"
}

 ```
Deletar Paciente
Método: DELETE
URL: https://clinica-youx-backend.onrender.com/pacientes/{id}
URL: https://localhost:8080/pacientes/{id}

Descrição: Esta rota deleta um paciente do sistema.
Autenticação: Necessário passar o token de autenticação.
Parâmetros: Substitua {id} pelo ID do paciente a ser deletado.  




