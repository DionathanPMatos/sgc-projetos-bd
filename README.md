SGC-Projetos – Banco de Dados Relacional

Projeto acadêmico da disciplina de Banco de Dados, criado com base no minimundo definido nas etapas anteriores da Experiência Prática.
O objetivo é modelar, implementar e manipular um banco de dados real utilizando MySQL e comandos SQL (DDL + DML).

Este repositório consolida a criação do esquema, inserção de dados, consultas, atualizações, exclusões e documentação básica do projeto.

Objetivo do Projeto

Desenvolver um banco de dados funcional para um Sistema de Gestão Comercial de Projetos Técnicos (SGC-Projetos).
O sistema armazena informações de clientes, produtos, categorias, projetos, propostas, itens de propostas e anexos, permitindo simular um fluxo comercial real (baseado no minimundo de uma distribuidora de tecnologia).

🛠️ Tecnologias Utilizadas

MySQL 8.x

MySQL Workbench

SQL (DDL + DML)

Git e GitHub para versionamento

Estrutura do Repositório
sgc-projetos-bd/
 ├─ sql/
 │   ├─ 01_create_schema.sql
 │   ├─ 02_insert_data.sql
 │   ├─ 03_select_queries.sql
 │   ├─ 04_update_delete.sql
 ├─ README.md


sql/01_create_schema.sql

Criação do banco e das tabelas, incluindo chaves primárias e estrangeiras.

sql/02_insert_data.sql

População inicial do banco com dados coerentes ao minimundo.

sql/03_select_queries.sql

Consultas SQL usando WHERE, JOIN, ORDER BY, LIMIT, etc.

sql/04_update_delete.sql

Comandos UPDATE e DELETE com condições e integridade referencial.

Modelo Lógico

O banco de dados foi construído com base no modelo lógico desenvolvido na EP2 e revisado na EP3, contendo as seguintes entidades principais:

CLIENTE

VENDEDOR

RESPONSAVEL_TECNICO

CATEGORIA

PRODUTO

PROJETO

PROPOSTA

ITEM_PROPOSTA

ANEXO

Todas as tabelas foram normalizadas até a Terceira Forma Normal (3FN).

Como Executar o Projeto
1. Criar o banco e as tabelas

Abra o arquivo:

sql/01_create_schema.sql


No MySQL Workbench, execute o script inteiro (Ctrl + Shift + Enter).

2. Inserir os dados de exemplo

Execute:

sql/02_insert_data.sql


Você terá clientes, produtos, projetos, propostas e itens relacionados.

3. Executar consultas

Execute:

sql/03_select_queries.sql


As consultas incluem:

JOIN entre múltiplas tabelas

Listagens ordenadas

Filtros com WHERE

LIMIT para delimitar resultados

Consultas detalhadas do fluxo comercial

4. Rodar comandos de UPDATE e DELETE

Execute:

sql/04_update_delete.sql


Os comandos tratam:

Ajuste de status de propostas

Atualização de preços por categoria

Remoção de registros dependentes

Exclusão de dados inválidos

Exemplos de Consultas

Algumas das consultas presentes no script:

✔️ Projetos com nome do cliente e vendedor
✔️ Itens de uma proposta específica com JOIN
✔️ Top 3 propostas de maior valor
✔️ Produtos com categorias
✔️ Filtragem por condições

Integridade e Normalização

Todo o banco foi construído seguindo:

1FN: dados atômicos, sem listas ou campos repetidos

2FN: dependência total da chave composta (ITEM_PROPOSTA)

3FN: sem dependências transitivas

As chaves estrangeiras utilizam ON DELETE e ON UPDATE adequados para garantir consistência.

Aprendizados da Atividade

Ao longo da criação deste projeto foi possível praticar:

Construção de esquema relacional completo

Criação de tabelas com PK, FK e restrições

Inserção, consulta, atualização e remoção de dados

Análise de erros e ajustes de sintaxe

Organização de scripts SQL em repositório versionado

Aplicação prática do modelo lógico desenvolvido nas EPs anteriores
