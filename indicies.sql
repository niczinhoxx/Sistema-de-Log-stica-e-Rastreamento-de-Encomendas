-- Otimiza busca rápida por código de rastreio público
CREATE INDEX idx_encomendas_codigo_rastreio ON encomendas(codigo_rastreio);

-- Otimiza JOINs entre tabelas
CREATE INDEX idx_encomendas_cliente_id ON encomendas(cliente_id);
CREATE INDEX idx_historico_encomenda_id ON historico_rastreamento(encomenda_id);