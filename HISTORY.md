Resumo do Projeto
 Este projeto foi desenvolvido como parte de um desafio técnico para vaga DevOps Júnior. A proposta era criar uma API REST simples de comentários, containerizar a aplicação, automatizar a infraestrutura, implementar CI/CD e configurar o monitoramento básico da aplicação.
Decisões Técnicas
API
·	FastAPI
Optei por utilizar o framework FastAPI que oferece uma interface interativa via Swagger. Criei uma aplicação Python para adicionar e listar os comentários (conforme solicitação do Desafio) tanto via terminal como através do Browser (/docs).
Banco de Dados
·	PostgreSQL
·	SQLAlchemy
O Banco de Dados escolhido foi o PostgreSQL, por ser gratuito, confiável e de fácil integração com Docker. Para facilitar a manipulação dos dados, utilizei SQLAlchemy como ORM, permitindo a interação com o banco por meio de classes Python, ao invés de comandos SQL diretamente.
Containerização
·	Docker
·	Docker Compose
API containerizada por meio de um Dockerfile e publicada no Docker Hub, utilizei docker compose para criar e gerenciar os demais containers pois definir dependências e serviços em um único arquivo YAML simplificou a produção localmente, e posteriormente o deploy remoto na VM. 
Containers rodando com docker compose: Banco de Dados, API, Prometheus e Grafana.
Infraestrutura
·	Google Cloud Platform (GCP)
·	Terraform
Escolhi o GCP por familiaridade e por possuir uma camada gratuita funcional, utilizei Terraform para provisionamento da infraestrutura no Google Cloud com criação de instância, rede, firewall e script de inicialização. Finalizando o projeto percebi que não havia realizado um reboot da VM e não havia fixado um IP, logo perderia a configuração de rede, reservei um IP estático em minha VPC, porém fiz manualmente na plataforma e não diretamente no Terraform, para não deixar quebrado meu tf.state modifiquei meu main.tf para importar o recurso.
CI/CD
·	GitHub Actions
Para a pipeline decidi usar o GitHub Actions por facilidade de ambientação estando na mesma plataforma do GitHub, durante o processo de autenticação foram utilizadas secrets vars pelo runner para build e deploy.
Monitoramento
·	Prometheus
·	Node Exporter
·	Grafana
Na etapa de monitoramento optei por usar o Prometheus para coletar as métricas da API pois era uma ferramenta que não havia utilizado anteriormente, Node Exporter para expor métricas da VM (GCP), Grafana usado para criar 2 Dashboards referente a cada métrica.
Dificuldades Encontradas
·	Entender o objetivo do projeto e conseguir absorver as informações para tirá-lo do PDF e iniciar a criação da estrutura.
·	Configuração dos arquivos de ambiente da API necessitei buscar/pesquisar orientação para elaborar os códigos Python corretamente, pois não saberia escrever o código manualmente ou do zero.
Melhorias Futuras
·	Configuração do ambiente de rede: HTTPS, Load Balancer e DNS.
·	Automatização do Node Exporter.
·	Implementar autenticação de usuário na API, pois qualquer pessoa pode acessar e adicionar dados.
·	Monitoramento mais preciso e completo (conforme necessidade do projeto para não gastar recursos).



