USE sgc_projetos;

-- CLIENTE
INSERT INTO cliente (nome, cnpj_cpf, email, telefone, segmento) VALUES
('Supermercados Bom Preço', '12.345.678/0001-90', 'contato@bompreco.com', '(11) 4000-1000', 'Varejo'),
('Indústria Alfa Ltda', '98.765.432/0001-10', 'engenharia@alfa.com', '(11) 3555-2200', 'Industrial'),
('Prefeitura Municipal de Delta', '11.222.333/0001-44', 'compras@delta.gov.br', '(31) 3222-9000', 'Órgão Público');

-- VENDEDOR
INSERT INTO vendedor (nome, email) VALUES
('Dionathan Matos', 'dionathan@dca.com.br'),
('Ana Paula Silva', 'ana.silva@dca.com.br');

-- RESPONSAVEL_TECNICO
INSERT INTO responsavel_tecnico (nome, email, registro_profissional) VALUES
('Carlos Engenheiro', 'carlos.eng@dca.com.br', 'CREA 12345'),
('Mariana Projetista', 'mariana.proj@dca.com.br', 'CREA 67890');

-- CATEGORIA
INSERT INTO categoria (nome_categoria) VALUES
('CFTV'),
('Rede'),
('Data Center');

-- PRODUTO
INSERT INTO produto (cod_produto, descricao, preco_base, id_categoria) VALUES
('DH-IPC-HFW5442', 'Câmera IP 4MP lente motorizada', 1200.00, 1),
('DH-NVR5216',     'NVR 16 canais IP',                2500.00, 1),
('SW-24P-GIGA',    'Switch 24 portas Gigabit',        1800.00, 2),
('RACK-44U',       'Rack fechado 44U',                3500.00, 3);

-- PROJETO
INSERT INTO projeto (titulo, data_criacao, descricao_resumida, status_projeto,
                     valor_estimado, id_cliente, id_vendedor, id_resp_tecnico)
VALUES
('CFTV Loja Central Bom Preço', '2025-03-10',
 'Sistema de monitoramento interno e externo', 'Em análise',
 85000.00, 1, 1, 1),
('Segurança Perimetral Indústria Alfa', '2025-03-15',
 'CFTV e controle de acesso externo', 'Em aprovação',
 120000.00, 2, 1, 2),
('Monitoramento Prédios Públicos Delta', '2025-03-20',
 'Projeto de CFTV para prédios da prefeitura', 'Proposta enviada',
 200000.00, 3, 2, 1);

-- PROPOSTA
INSERT INTO proposta (numero, data_envio, valor_total, status_proposta, id_projeto)
VALUES
('PROP-2025-001', '2025-03-18', 87000.00, 'Enviada', 1),
('PROP-2025-002', '2025-03-22', 122500.00, 'Em negociação', 2),
('PROP-2025-003', '2025-03-25', 205000.00, 'Enviada', 3);

-- ITEM_PROPOSTA
INSERT INTO item_proposta (id_proposta, id_produto, quantidade, valor_unitario, desconto) VALUES
(1, 1, 40, 1100.00, 0.00),
(1, 2,  2, 2400.00, 0.00),
(2, 1, 50, 1080.00, 1000.00),
(2, 3,  3, 1750.00, 0.00),
(3, 1, 60, 1050.00, 2000.00),
(3, 4,  5, 3400.00, 0.00);

-- ANEXO
INSERT INTO anexo (tipo_arquivo, nome_arquivo, caminho_arquivo, id_projeto) VALUES
('PDF', 'escopo_tecnico_bom_preco.pdf', '/docs/escopos/bom_preco.pdf', 1),
('XLSX', 'planilha_materiais_industria_alfa.xlsx', '/docs/planilhas/ind_alfa.xlsx', 2),
('PDF', 'memorial_descritivo_pref_delta.pdf', '/docs/escopos/pref_delta.pdf', 3);
