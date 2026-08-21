CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE clientes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE encomendas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
    codigo_rastreio VARCHAR(20) UNIQUE NOT NULL,
    status_atual VARCHAR(30) NOT NULL DEFAULT 'PENDENTE',
    origem VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    peso_kg DECIMAL(5,2) CHECK (peso_kg > 0),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_status CHECK (status_atual IN ('PENDENTE', 'EM_TRANSITO', 'SAIU_PARA_ENTREGA', 'ENTREGUE', 'CANCELADO'))
);

CREATE TABLE historico_rastreamento (
    id SERIAL PRIMARY KEY,
    encomenda_id UUID NOT NULL REFERENCES encomendas(id) ON DELETE CASCADE,
    status_anterior VARCHAR(30),
    status_novo VARCHAR(30) NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    observacao TEXT,
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);