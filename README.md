# Infraestrutura 3-Tier na AWS com Terraform

Este repositório contém a infraestrutura de exemplo para uma arquitetura 3-Tier (Web, App e Banco de Dados) na AWS utilizando o Terraform. A infraestrutura é composta pelos seguintes componentes:

- **VPC (Virtual Private Cloud)**
- **Subnets (Web, App, DB)**
- **Internet Gateway e Routing**
- **Auto Scaling para o Web Tier**
- **Application Load Balancer (ALB)**
- **RDS Multi-AZ (Relational Database Service)**
- **Route 53 para DNS**
- **CloudFront para distribuição de conteúdo**

## Estrutura do Projeto

A estrutura de diretórios do projeto é organizada da seguinte forma:


three-tier-app/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── subnet/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── security_group/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── autoscaling/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── load_balancer/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── rds/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── route53/
│   │   ├── main.tf
│   │   └── variables.tf
└── terraform.tfvars

Pré-requisitos

Antes de começar, verifique se você tem os seguintes pré-requisitos:

    Terraform instalado em sua máquina.

    Uma conta da AWS configurada (com as credenciais acessíveis no ambiente, por exemplo, via aws configure).


Como Usar

    Clone o repositório:

git clone https://github.com/seu-usuario/projeto-terraform-aws.git
cd projeto-terraform-aws

Inicialize o Terraform:
Este comando irá baixar os plugins necessários para o Terraform trabalhar com a AWS.

terraform init

Defina as variáveis:
O arquivo terraform.tfvars é utilizado para fornecer os valores das variáveis no Terraform. Aqui, você pode definir, por exemplo, o nome do projeto, a região da AWS, entre outros. Um exemplo de terraform.tfvars pode ser:

region = "us-east-1"
vpc_name = "main-vpc"
db_username = "admin"
db_password = "password123"

Verifique o plano de execução:
Antes de aplicar as mudanças, é sempre bom verificar o que será feito.

terraform plan

Aplique a infraestrutura:
Para provisionar os recursos na AWS, execute:

    terraform apply

    Confirmar:
    O Terraform irá pedir para confirmar a criação dos recursos. Digite yes para prosseguir.

    Acessar os Outputs:
    Após a execução bem-sucedida, os outputs definidos no arquivo outputs.tf serão exibidos. Exemplos de outputs podem incluir o DNS do Load Balancer, o endpoint do RDS, etc.

Estrutura dos Módulos

Módulo autoscaling

Esse módulo configura o Auto Scaling para o Web Tier da aplicação. Ele utiliza um Launch Template e uma Auto Scaling Group para gerenciar o número de instâncias no grupo de escalonamento.

Módulo load_balancer

Configura um Application Load Balancer (ALB) para distribuir o tráfego entre as instâncias do Web Tier. O módulo também configura o Target Group e o Listener para o ALB.

Módulo rds

Este módulo configura um banco de dados relacional (RDS) no AWS, com uma configuração Multi-AZ para alta disponibilidade. Ele utiliza o MySQL como o mecanismo de banco de dados e cria um DB Subnet Group para garantir que o banco de dados esteja em subnets privadas.

Módulo route53

O módulo configura o Route 53 para gerenciamento de DNS e o CloudFront para distribuição de conteúdo com um certificado SSL. Ele cria uma zona DNS e registros A para o domínio configurado.
Outputs

Os outputs definidos no outputs.tf podem incluir, mas não se limitam a:

    Web Load Balancer DNS: O nome DNS do Load Balancer para acessar a aplicação.

    RDS Endpoint: O endpoint do banco de dados RDS.

    CloudFront Distribution URL: A URL do CloudFront para distribuição de conteúdo.

Limpeza

Para destruir os recursos criados, você pode usar o seguinte comando:

terraform destroy

Isso removerá todos os recursos provisionados pela infraestrutura.
Contribuições

Sinta-se à vontade para fazer contribuições, criar issues ou enviar pull requests para melhorar o projeto.
Licença

Este projeto é licenciado sob a Licença MIT - consulte o arquivo LICENSE para mais detalhes.


### Explicação do conteúdo:

- **Introdução**: Uma breve descrição do que o repositório contém.
- **Estrutura do projeto**: Explicação da estrutura de diretórios e como os módulos são organizados.
- **Pré-requisitos**: Como preparar o ambiente para rodar o Terraform (como instalar o Terraform e configurar as credenciais da AWS).
- **Como usar**: Passo a passo para inicializar, aplicar e verificar a infraestrutura.
- **Estrutura dos módulos**: Descrição dos módulos que compõem a infraestrutura.
- **Outputs**: O que você pode esperar como resultado da execução do Terraform.
- **Limpeza**: Como destruir os recursos para evitar cobranças na AWS.
- **Contribuições**: Como os outros desenvolvedores podem contribuir para o projeto.
- **Licença**: Informação sobre a licença do projeto.

Esse `README.md` serve como um guia completo para qualquer pessoa que deseje usar ou colaborar com seu projeto Terraform.

