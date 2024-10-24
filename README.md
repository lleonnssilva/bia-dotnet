# Esse conteúdo faz parte da Formação AWS.

- Link para entrar para a Formação AWS: https://inscricao.formacaoaws.com.br

- Canal do Youtube: https://www.youtube.com/@henryllemaia

### Siga as orientacoes para rodar o seu projeto com docker

_Obs: Atente para a arquitetura da sua máquina, como é explicado na aula_ 


# Bia Bootcamp Imersão AWS 

Versão Adaptada de Node/React para .Net

# Ferramentas e bibliotecas do projeto

Segue algumas informações de quais ferramentas e importações você precisa ter 

1. Visual Studio
2. .NET Sdk 8.0
3. Microsoft.EntityFrameworkCore.Design
4. Npgsql.EntityFrameworkCore.PostgreSQL
5. Microsoft.EntityFrameworkCore
6. Docker
7. Git


## Setup

Comando para clonar o repositório e começar a usar.

```bash
git clone https://github.com/lleonnssilva/bia-dotnet.git
```



Iniciar o projeto com docker
```bash
docker compose up -d
```
Acessar
http://localhost:3001/

#### Migrations Create ####

docker exec -it id_container dotnet ef migrations add InitilCreate

#### Migrations Update ####

docker exec -it id_container dotnet ef database update
