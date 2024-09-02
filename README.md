﻿## Projeto base para o evento Bootcamp Imersão AWS que irei realizar.

### Período do evento: 05 a 11 de Agosto/2024 (Online e ao Vivo às 20h)

[>> Página de Inscrição do evento](https://org.imersaoaws.com.br/github/readme)

### Bia Bootcamp Imersão AWS 
Adaptada de Node/React para .Net

#### Adicionar as dependências
Usar .NET.Sdk 8.0
Microsoft.EntityFrameworkCore
Microsoft.EntityFrameworkCore.Design
Npgsql.EntityFrameworkCore.PostgreSQL

### Rodar local
Rodar Local 
-comentar os valores na string de  conexão no projeto
 //"ConnectionStrings": {
   // "DefaultConnection": "User ID=postgres;Password=postgres;Server=localhost;Port=5433;Database=bia; Pooling=true;"
  //}
-Setar a variável stringConnection no docker-compose.yml
environment:
      ConnectionStrings__DefaultConnection: User ID=postgres;Password=postgres;Server=database;Port=5432;Database=bia; Pooling=true;
-Comandos
docker compose up -d
http://localhost:3001/

### Formas de aplicar Migrations
-1 ---Migrations----
1.1 Migrations em máquina Local:
-Descomenta ConnectionStrings e setar os valores da string de  conexão no projeto para executar o migrations Localhost
 "ConnectionStrings": {
    "DefaultConnection": "User ID=postgres;Password=postgres;Server=localhost;Port=5433;Database=bia; Pooling=true;"
  }

-executar comandos  
#dotnet tool update --global dotnet-ef
dotnet ef migrations add InitialCreate
dotnet ef database update

-acesso pelo Dbever
host:localhost:5433/bia
user:postgres
password:postgres

1.2 Migrations RDS com Túnel Local e Bastion Host :
-Criar um bastion ec2 com  SG dev-bastion-host com permissão ssh
-Adicionar permissão no SG dev-bd com permissão PostgreSQL do SG dev-bastion-host
-Descomenta ConnectionStrings e setar os valores da string de  conexão no projeto para executar o migrations no RDS
 "ConnectionStrings": {
    "DefaultConnection": "User ID=postgres;Password=senha_rds;Server=localhost;Port=5434;Database=bia; Pooling=true;"
  }
-ssh -f -N -i "suachave.pem" -L 5434:host_rds:5432 ec2bastion

-executar comandos  pós abrir conexão
#dotnet tool update --global dotnet-ef
dotnet ef migrations add InitialCreate
dotnet ef database update

-acesso pelo Dbever
host:localhost:5434/bia
user:postgres
password:senha_rds


1.3 Migrations máquina local e RDS acesso publico (não recomendado)
-Adicionar permissão no SG dev-bd  para  porta PostgresSQL para ip da sua máquina
-Descomenta ConnectionStrings e setar os valores da string de  conexão no projeto para executar o migrations no RDS
 "ConnectionStrings": {
    "DefaultConnection": "User ID=postgres;Password=senha_rds;Server=host_rds;Port=5432;Database=bia; Pooling=true;"
  }

-executar comandos  após abrir conexão
#dotnet tool update --global dotnet-ef
dotnet ef migrations add InitialCreate
dotnet ef database update

-acesso pelo Dbever
host:host_rds
user:postgres
password:senha_rds

1.4 Com SSM
1.5 Com DMS
....

-2 ----Máquina Local docker via comando psql----
-executar container postgres na base bia
docker exec -it ad495bdcfa70 psql -U postgres -d bia

-listar tabelas
\dt

-criar tabela Tarefas
CREATE TABLE public."Tarefas" (
	"uuid" uuid NOT NULL,
	dia_atividade text NOT NULL,
	titulo text NOT NULL,
	importante bool NOT NULL,
	"createdAt" timestamptz NOT NULL,
	"updatedAt" timestamptz NOT NULL,
	CONSTRAINT "PK_Tarefas" PRIMARY KEY (uuid)
);

acesso pelo Dbever
host:localhost:5433/bia
user:postgres
password:postgres
