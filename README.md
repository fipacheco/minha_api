# MinhaApi

Minha API - Sistema de Blog com Ecto

Visão Geral

Este é um projeto básico de API construído com Elixir e Phoenix, utilizando Ecto para interagir com o banco de dados. A aplicação implementa um sistema de blog simples com funcionalidades para gerenciar autores, posts, comentários e reações.

Tecnologias Utilizadas

Elixir: Linguagem de programação funcional usada para construir aplicações escaláveis e de alta performance.
Phoenix Framework: Framework web utilizado para construir aplicações web modernas em Elixir.
Ecto: Biblioteca para interação com bancos de dados em Elixir, fornecendo mapeamento objeto-relacional (ORM) e consultas.
PostgreSQL: Sistema de gerenciamento de banco de dados relacional utilizado para armazenar os dados da aplicação.
Funcionalidades

Autores: CRUD (Create, Read, Update, Delete) de autores.
Posts: CRUD de posts, incluindo associação com autores.
Comentários: CRUD de comentários associados a posts e autores.
Reações: CRUD de reações associadas a posts e autores.
Estrutura do Projeto

Schemas: Definidos em lib/minha_api/blog/, incluindo author.ex, post.ex, comment.ex e reaction.ex.
Contexto: O módulo MinhaApi.Blog em lib/minha_api/blog/blog.ex centraliza a lógica de manipulação de dados para todas as entidades.
Controllers: Controladores para cada entidade, responsáveis por lidar com as requisições HTTP e retornar respostas JSON diretamente.
Rotas: Definidas em lib/minha_api_web/router.ex, mapeando os endpoints da API.


Configuração e Execução

Pré-requisitos
Elixir: Certifique-se de que o Elixir está instalado (versão recomendada: 1.12 ou superior).
Phoenix Framework: Se não estiver instalado, instale com mix archive.install hex phx_new.
PostgreSQL: O banco de dados PostgreSQL deve estar instalado e em execução.


Configuração do Projeto

Clonar o Repositório

git clone https://github.com/seu_usuario/minha_api.git
cd minha_api
Instalar as Dependências

Execute o comando para instalar as dependências do projeto:


mix deps.get
Configurar o Banco de Dados
Certifique-se de que o PostgreSQL está em execução e configure as credenciais no arquivo config/dev.exs:


config :minha_api, MinhaApi.Repo,
  username: "seu_usuario",
  password: "sua_senha",
  database: "minha_api_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10


Criar e Migrar o Banco de Dados
Crie o banco de dados e execute as migrações:


mix ecto.create
mix ecto.migrate

Iniciar o Servidor

Inicie o servidor Phoenix:


mix phx.server

A aplicação estará disponível em http://localhost:4000.

Endpoints da API

Autores
GET /api/authors: Lista todos os autores.
GET /api/authors/:id: Obtém um autor específico.
POST /api/authors: Cria um novo autor.
PUT /api/authors/:id: Atualiza um autor existente.
DELETE /api/authors/:id: Exclui um autor.

Posts
GET /api/posts: Lista todos os posts.
GET /api/posts/:id: Obtém um post específico.
POST /api/posts: Cria um novo post.
PUT /api/posts/:id: Atualiza um post existente.
DELETE /api/posts/:id: Exclui um post.

Comentários
GET /api/comments: Lista todos os comentários.
GET /api/comments/:id: Obtém um comentário específico.
POST /api/comments: Cria um novo comentário.
PUT /api/comments/:id: Atualiza um comentário existente.
DELETE /api/comments/:id: Exclui um comentário.

Reações
GET /api/reactions: Lista todas as reações.
GET /api/reactions/:id: Obtém uma reação específica.
POST /api/reactions: Cria uma nova reação.
PUT /api/reactions/:id: Atualiza uma reação existente.
DELETE /api/reactions/:id: Exclui uma reação.



Testes

Para executar os testes, use:


mix test

Certifique-se de configurar o banco de dados de teste em config/test.exs e executar as migrações:


MIX_ENV=test mix ecto.create
MIX_ENV=test mix ecto.migrate

Considerações Finais

Este projeto serve como base para uma API REST simples utilizando Elixir, Phoenix e Ecto. Ele pode ser expandido e personalizado conforme as necessidades do seu aplicativo.