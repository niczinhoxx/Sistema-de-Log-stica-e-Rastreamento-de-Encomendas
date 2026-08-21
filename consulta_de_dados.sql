-- 1. Linha do tempo de um pacote com CTE (e LEFT JOIN para funcionar mesmo se não houver histórico)
WITH LinhaDoTempo AS (
    SELECT 
        e.codigo_rastreio,
        c.nome AS cliente,
        COALESCE(h.status_anterior, 'CRIADO') AS status_anterior,
        COALESCE(h.status_novo, e.status_atual) AS status_atual,
        COALESCE(h.localizacao, e.origem) AS localizacao,
        COALESCE(h.data_alteracao, e.criado_em) AS data_registro
    FROM encomendas e
    JOIN clientes c ON e.cliente_id = c.id
    LEFT JOIN historico_rastreamento h ON h.encomenda_id = e.id
    WHERE e.codigo_rastreio = 'BR123456789PT'
)
SELECT * FROM LinhaDoTempo ORDER BY data_registro ASC;

-- 2. Métricas de Encomendas por Status (Dashboard)
SELECT 
    status_atual,
    COUNT(*) AS total_encomendas,
    ROUND(AVG(peso_kg), 2) AS peso_medio_kg
FROM encomendas
GROUP BY status_atual
ORDER BY total_encomendas DESC;

-- 3. Última atualização registrada usando Window Function (Busca o estado mais recente de CADA pacote)
WITH UltimosEventos AS (
    SELECT 
        e.codigo_rastreio,
        COALESCE(h.status_novo, e.status_atual) AS ultimo_status,
        COALESCE(h.data_alteracao, e.atualizado_em) AS data_ultima_atualizacao,
        ROW_NUMBER() OVER (
            PARTITION BY e.id 
            ORDER BY COALESCE(h.data_alteracao, e.atualizado_em) DESC
        ) AS ordenacao
    FROM encomendas e
    LEFT JOIN historico_rastreamento h ON e.id = h.encomenda_id
)
SELECT 
    codigo_rastreio,
    ultimo_status,
    data_ultima_atualizacao
FROM UltimosEventos
WHERE ordenacao = 1;

-- 4. Análise de Plano de Execução Otimizado com Índice
EXPLAIN ANALYZE 
SELECT * FROM encomendas WHERE codigo_rastreio = 'BR123456789PT';