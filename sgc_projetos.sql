-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/12/2025 às 00:39
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sgc_projetos`
--

--
-- Despejando dados para a tabela `anexo`
--

INSERT INTO `anexo` (`id_anexo`, `tipo_arquivo`, `nome_arquivo`, `caminho_arquivo`, `id_projeto`) VALUES
(1, 'PDF', 'escopo_tecnico_bom_preco.pdf', '/docs/escopos/bom_preco.pdf', 1),
(2, 'XLSX', 'planilha_materiais_industria_alfa.xlsx', '/docs/planilhas/ind_alfa.xlsx', 2),
(3, 'PDF', 'memorial_descritivo_pref_delta.pdf', '/docs/escopos/pref_delta.pdf', 3);

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome_categoria`) VALUES
(1, 'CFTV'),
(2, 'Rede'),
(3, 'Data Center');

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cnpj_cpf`, `email`, `telefone`, `segmento`) VALUES
(1, 'Supermercados Bom Preço', '12.345.678/0001-90', 'contato@bompreco.com', '(11) 4000-1000', 'Varejo'),
(2, 'Indústria Alfa Ltda', '98.765.432/0001-10', 'engenharia@alfa.com', '(11) 3555-2200', 'Industrial'),
(3, 'Prefeitura Municipal de Delta', '11.222.333/0001-44', 'compras@delta.gov.br', '(31) 3222-9000', 'Órgão Público');

--
-- Despejando dados para a tabela `item_proposta`
--

INSERT INTO `item_proposta` (`id_proposta`, `id_produto`, `quantidade`, `valor_unitario`, `desconto`) VALUES
(1, 1, 40, 1100.00, 0.00),
(1, 2, 2, 2400.00, 0.00),
(2, 1, 50, 1080.00, 1000.00),
(2, 3, 3, 1750.00, 0.00),
(3, 1, 60, 1050.00, 2000.00),
(3, 4, 5, 3400.00, 0.00);

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `cod_produto`, `descricao`, `preco_base`, `id_categoria`) VALUES
(1, 'DH-IPC-HFW5442', 'Câmera IP 4MP lente motorizada', 1200.00, 1),
(2, 'DH-NVR5216', 'NVR 16 canais IP', 2500.00, 1),
(3, 'SW-24P-GIGA', 'Switch 24 portas Gigabit', 1800.00, 2),
(4, 'RACK-44U', 'Rack fechado 44U', 3500.00, 3);

--
-- Despejando dados para a tabela `projeto`
--

INSERT INTO `projeto` (`id_projeto`, `titulo`, `data_criacao`, `descricao_resumida`, `status_projeto`, `valor_estimado`, `id_cliente`, `id_vendedor`, `id_resp_tecnico`) VALUES
(1, 'CFTV Loja Central Bom Preço', '2025-03-10', 'Sistema de monitoramento interno e externo', 'Em análise', 85000.00, 1, 1, 1),
(2, 'Segurança Perimetral Indústria Alfa', '2025-03-15', 'CFTV e controle de acesso externo', 'Em aprovação', 120000.00, 2, 1, 2),
(3, 'Monitoramento Prédios Públicos Delta', '2025-03-20', 'Projeto de CFTV para prédios da prefeitura', 'Proposta enviada', 200000.00, 3, 2, 1);

--
-- Despejando dados para a tabela `proposta`
--

INSERT INTO `proposta` (`id_proposta`, `numero`, `data_envio`, `valor_total`, `status_proposta`, `id_projeto`) VALUES
(1, 'PROP-2025-001', '2025-03-18', 87000.00, 'Enviada', 1),
(2, 'PROP-2025-002', '2025-03-22', 122500.00, 'Em negociação', 2),
(3, 'PROP-2025-003', '2025-03-25', 205000.00, 'Enviada', 3);

--
-- Despejando dados para a tabela `responsavel_tecnico`
--

INSERT INTO `responsavel_tecnico` (`id_resp_tecnico`, `nome`, `email`, `registro_profissional`) VALUES
(1, 'Carlos Engenheiro', 'carlos.eng@dca.com.br', 'CREA 12345'),
(2, 'Mariana Projetista', 'mariana.proj@dca.com.br', 'CREA 67890');

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `nome`, `email`) VALUES
(1, 'Dionathan Matos', 'dionathan@dca.com.br'),
(2, 'Ana Paula Silva', 'ana.silva@dca.com.br');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
