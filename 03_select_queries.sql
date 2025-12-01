USE sgc_projetos;

-- 1) Listar todos os clientes em ordem alfabética
SELECT id_cliente, nome, segmento, telefone
FROM cliente
ORDER BY nome;

-- 2) Listar projetos com nome do cliente e vendedor (JOIN múltiplo)
SELECT
    p.id_projeto,
    p.titulo,
    c.nome       AS cliente,
    v.nome       AS vendedor,
    p.status_projeto,
    p.valor_estimado
FROM projeto p
JOIN cliente  c ON c.id_cliente  = p.id_cliente
JOIN vendedor v ON v.id_vendedor = p.id_vendedor
ORDER BY p.data_criacao DESC;

-- 3) Consultar itens de uma proposta específica (com filtro WHERE)
SELECT
    pr.numero      AS numero_proposta,
    cli.nome       AS cliente,
    prod.cod_produto,
    prod.descricao,
    ip.quantidade,
    ip.valor_unitario,
    ip.desconto
FROM item_proposta ip
JOIN proposta pr   ON pr.id_proposta = ip.id_proposta
JOIN projeto pj    ON pj.id_projeto  = pr.id_projeto
JOIN cliente cli   ON cli.id_cliente = pj.id_cliente
JOIN produto prod  ON prod.id_produto = ip.id_produto
WHERE pr.numero = 'PROP-2025-002';

-- 4) Top 3 propostas por valor_total (com LIMIT)
SELECT
    id_proposta,
    numero,
    valor_total,
    status_proposta
FROM proposta
ORDER BY valor_total DESC
LIMIT 3;

-- 5) Produtos e suas categorias
SELECT
    prod.id_produto,
    prod.cod_produto,
    prod.descricao,
    prod.preco_base,
    cat.nome_categoria
FROM produto prod
JOIN categoria cat ON cat.id_categoria = prod.id_categoria
ORDER BY cat.nome_categoria, prod.descricao;
