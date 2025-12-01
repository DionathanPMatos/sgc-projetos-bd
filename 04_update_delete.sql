USE sgc_projetos;

-- ===========================
-- COMANDOS UPDATE (3 exemplos)
-- ===========================

-- 1) Atualizar status de uma proposta para "Fechada" e ajustar valor_total
UPDATE proposta
SET status_proposta = 'Fechada', valor_total = 90000.00
WHERE numero = 'PROP-2025-001';

-- 2) Aumentar em 5% o preco_base dos produtos da categoria "CFTV"
UPDATE produto p
JOIN categoria c ON c.id_categoria = p.id_categoria
SET p.preco_base = p.preco_base * 1.05
WHERE c.nome_categoria = 'CFTV';

-- 3) Trocar o responsável técnico de um projeto específico
UPDATE projeto
SET id_resp_tecnico = 2
WHERE titulo = 'CFTV Loja Central Bom Preço';

-- ===========================
-- COMANDOS DELETE (3 exemplos)
-- ===========================

-- 1) Excluir anexos de um projeto que foi cancelado
DELETE a
FROM anexo a
JOIN projeto p ON p.id_projeto = a.id_projeto
WHERE p.status_projeto = 'Cancelado';


-- UPDATE projeto SET status_projeto = 'Cancelado' WHERE id_projeto = 3;

-- 2) Excluir itens de proposta com quantidade = 0 (dados inválidos)
DELETE FROM item_proposta
WHERE quantidade <= 0;

-- 3) Excluir cliente de testes (sem projetos associados)
DELETE FROM cliente
WHERE nome = 'Cliente Teste'
  AND id_cliente NOT IN (SELECT DISTINCT id_cliente FROM projeto);
