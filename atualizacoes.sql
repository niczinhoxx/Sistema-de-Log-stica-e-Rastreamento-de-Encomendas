-- Movimenta encomenda 1
UPDATE encomendas SET status_atual = 'EM_TRANSITO' WHERE codigo_rastreio = 'BR123456789PT';
UPDATE encomendas SET status_atual = 'SAIU_PARA_ENTREGA' WHERE codigo_rastreio = 'BR123456789PT';
UPDATE encomendas SET status_atual = 'ENTREGUE' WHERE codigo_rastreio = 'BR123456789PT';

-- Movimenta encomenda 2
UPDATE encomendas SET status_atual = 'EM_TRANSITO' WHERE codigo_rastreio = 'BR987654321RJ';

-- Movimenta encomenda 3 (Cancelamento)
UPDATE encomendas SET status_atual = 'CANCELADO' WHERE codigo_rastreio = 'BR555444333SP';