INSERT INTO clientes (id, nome, email, telefone) VALUES
('c1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Nicolas Silva', 'nicolas@email.com', '(24) 99999-1111'),
('a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', 'Maria Oliveira', 'maria@email.com', '(21) 98888-2222'),
('f1e2d3c4-b5a6-7f8e-9d0c-1b2a3f4e5d6c', 'TechCorp Logistics', 'contato@techcorp.com', '(11) 3000-4000');

INSERT INTO encomendas (id, cliente_id, codigo_rastreio, status_atual, origem, destino, peso_kg) VALUES
('e1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'c1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'BR123456789PT', 'PENDENTE', 'CD Rio de Janeiro', 'Petrópolis/RJ', 1.50),
('e2a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', 'BR987654321RJ', 'PENDENTE', 'CD São Paulo', 'Rio de Janeiro/RJ', 0.80),
('e3a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'f1e2d3c4-b5a6-7f8e-9d0c-1b2a3f4e5d6c', 'BR555444333SP', 'PENDENTE', 'CD Campinas', 'Curitiba/PR', 12.30);