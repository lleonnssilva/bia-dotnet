#!/bin/bash

#Instalar Docker e Git
sudo yum update -y
sudo yum install git -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ssm-user
id ec2-user ssm-user
sudo newgrp docker

#Ativar docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

#Instalar docker compose 2
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose


#Adicionar swap
sudo dd if=/dev/zero of=/swapfile bs=128M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab


#Instalar node e npm
curl -fsSL https://rpm.nodesource.com/setup_21.x | sudo bash -
sudo yum install -y nodejs

# Instalar o .NET SDK 8
sudo yum install -y dotnet-sdk-8.0

# Verificar a instalação
dotnet --version

# Realizar outras configurações, se necessário
# Por exemplo, criar um diretório para aplicações .NET
mkdir -p /home/ec2-user/dotnet-apps

# (Opcional) Clonar um repositório de exemplo, se necessário
# git clone https://github.com/your/repository.git /home/ec2-user/dotnet-apps/repository

# Configurar permissões, se necessário
# sudo chown -R ec2-user:ec2-user /home/ec2-user/dotnet-apps

# Outras configurações ou scripts podem ser adicionados aqui

dotnet tool update --global dotnet-ef