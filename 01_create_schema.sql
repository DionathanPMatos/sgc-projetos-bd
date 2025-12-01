-- Criação do banco
CREATE DATABASE IF NOT EXISTS sgc_projetos
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE sgc_projetos;

-- Tabela CLIENTE
CREATE TABLE cliente (
    id_cliente      INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    cnpj_cpf        VARCHAR(20) NOT NULL,
    email           VARCHAR(120),
    telefone        VARCHAR(20),
    segmento        VARCHAR(50)
) ENGINE=InnoDB;

-- Tabela VENDEDOR
CREATE TABLE vendedor (
    id_vendedor     INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(120)
) ENGINE=InnoDB;

-- Tabela RESPONSAVEL_TECNICO
CREATE TABLE responsavel_tecnico (
    id_resp_tecnico     INT AUTO_INCREMENT PRIMARY KEY,
    nome                VARCHAR(100) NOT NULL,
    email               VARCHAR(120),
    registro_profissional VARCHAR(50)
) ENGINE=InnoDB;

-- Tabela CATEGORIA
CREATE TABLE categoria (
    id_categoria    INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria  VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

-- Tabela PRODUTO
CREATE TABLE produto (
    id_produto      INT AUTO_INCREMENT PRIMARY KEY,
    cod_produto     VARCHAR(30) NOT NULL,
    descricao       VARCHAR(200) NOT NULL,
    preco_base      DECIMAL(10,2) NOT NULL,
    id_categoria    INT NOT NULL,
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria (id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Tabela PROJETO
CREATE TABLE projeto (
    id_projeto          INT AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(120) NOT NULL,
    data_criacao        DATE NOT NULL,
    descricao_resumida  TEXT,
    status_projeto      VARCHAR(40) NOT NULL,
    valor_estimado      DECIMAL(10,2),
    id_cliente          INT NOT NULL,
    id_vendedor         INT NOT NULL,
    id_resp_tecnico     INT NOT NULL,
    CONSTRAINT fk_projeto_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente),
    CONSTRAINT fk_projeto_vendedor
        FOREIGN KEY (id_vendedor)
        REFERENCES vendedor (id_vendedor),
    CONSTRAINT fk_projeto_resp_tecnico
        FOREIGN KEY (id_resp_tecnico)
        REFERENCES responsavel_tecnico (id_resp_tecnico)
) ENGINE=InnoDB;

-- Tabela PROPOSTA
CREATE TABLE proposta (
    id_proposta     INT AUTO_INCREMENT PRIMARY KEY,
    numero          VARCHAR(40) NOT NULL,
    data_envio      DATE,
    valor_total     DECIMAL(10,2),
    status_proposta VARCHAR(40) NOT NULL,
    id_projeto      INT NOT NULL,
    CONSTRAINT fk_proposta_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES projeto (id_projeto)
) ENGINE=InnoDB;

-- Tabela ITEM_PROPOSTA (tabela associativa)
CREATE TABLE item_proposta (
    id_proposta     INT NOT NULL,
    id_produto      INT NOT NULL,
    quantidade      INT NOT NULL,
    valor_unitario  DECIMAL(10,2) NOT NULL,
    desconto        DECIMAL(10,2) DEFAULT 0,
    PRIMARY KEY (id_proposta, id_produto),
    CONSTRAINT fk_item_proposta_proposta
        FOREIGN KEY (id_proposta)
        REFERENCES proposta (id_proposta)
        ON DELETE CASCADE,
    CONSTRAINT fk_item_proposta_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto)
) ENGINE=InnoDB;

-- Tabela ANEXO
CREATE TABLE anexo (
    id_anexo        INT AUTO_INCREMENT PRIMARY KEY,
    tipo_arquivo    VARCHAR(20) NOT NULL,
    nome_arquivo    VARCHAR(120) NOT NULL,
    caminho_arquivo VARCHAR(255),
    id_projeto      INT NOT NULL,
    CONSTRAINT fk_anexo_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES projeto (id_projeto)
        ON DELETE CASCADE
) ENGINE=InnoDB;
