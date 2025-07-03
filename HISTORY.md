# HISTORY.md

## Resumo do Projeto

Este projeto foi desenvolvido como parte de um desafio técnico para a vaga DevOps Júnior.  
A proposta incluía:

- Criar uma API REST simples de comentários.
- Containerizar a aplicação.
- Automatizar a infraestrutura.
- Implementar CI/CD.
- Configurar o monitoramento básico da aplicação.

---

## Decisões Técnicas

### API
- Framework: FastAPI  
  Escolhi o FastAPI por oferecer uma interface interativa via Swagger. A aplicação permite adicionar e listar comentários, acessíveis tanto pelo terminal quanto pelo navegador através da rota `/docs`.

---

### Banco de Dados
- PostgreSQL
- SQLAlchemy

O PostgreSQL foi escolhido por ser gratuito, confiável e fácil de integrar com Docker.  
Utilizei o SQLAlchemy como ORM, facilitando a manipulação dos dados através de classes Python.

---

### Containerização
- Docker
- Docker Compose

A aplicação foi containerizada com um `Dockerfile` e publicada no Docker Hub.  
O Docker Compose foi utilizado para gerenciar os serviços, facilitando a estrutura local e Deploy na VM.

Containers utilizados:
- API
- Banco de Dados
- Prometheus
- Grafana

---

### Infraestrutura
- Google Cloud Platform (GCP)
- Terraform

Escolhi o GCP por já ter familiaridade e por oferecer camada gratuita.  
Utilizei Terraform para provisionar:
- Instância
- Rede
- Firewall
- Script de inicialização

Durante a finalização percebi que não haviado reiniciado a VM desde a criação com o Terraform e a configuração de rede estava somente para criar IP público, posteriormente reservei um IP estático manualmente na VPC e adaptei o `main.tf` para importar o recurso, mantendo o `terraform.tfstate` íntegro, além de criar um Bucket no Cloud Storage para armazenar.

---

### CI/CD
- GitHub Actions

Optei pelo GitHub Actions por estar na mesma plataforma do repositório e oferecer fácil integração.  
Usei secrets para autenticar o runner, que realiza o build e o deploy remoto via SSH.

---

### Monitoramento
- Prometheus
- Node Exporter
- Grafana

Implementei monitoramento utilizando:
- Prometheus para coleta de métricas da API
- Node Exporter para métricas da VM
- Grafana com dois dashboards para visualização

Essa stack foi escolhida por aprendizado, especialmente com Prometheus que ainda não havia utilizado.

---

## Dificuldades Encontradas

- Entender o objetivo do projeto a partir do PDF, absorver as informações e iniciar o projeto real.
- A configuração dos arquivos de ambiente da API necessitei buscar/pesquisar orientação para elaborar os códigos Python corretamente, pois não saberia escrever o código manualmente ou do zero.

---

## Melhorias Futuras

- Configurar HTTPS, Load Balancer e DNS.
- Automatizar o Node Exporter.
- Implementar autenticação de usuário na API para restringir acesso.
- Adicionar métricas mais precisas e completas, conforme necessidade futura do projeto e consumo de recursos.

---