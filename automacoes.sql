CREATE OR REPLACE FUNCTION trg_log_status_encomenda()
RETURNS TRIGGER AS $$
BEGIN 
    -- Atualiza o campo atualizado_em da tabela principal
    NEW.atualizado_em = CURRENT_TIMESTAMP;
    
    -- Insere o registro de auditoria na tabela de histórico
    IF (OLD.status_atual IS DISTINCT FROM NEW.status_atual) THEN
        INSERT INTO historico_rastreamento (
            encomenda_id, 
            status_anterior, 
            status_novo, 
            localizacao, 
            observacao
        ) VALUES (
            NEW.id,
            OLD.status_atual,
            NEW.status_atual, -- Corrigido para apontar para a coluna da tabela 'encomendas'
            NEW.destino,
            'Status atualizado via automação de sistema.'
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Vinculando a Trigger à tabela de encomendas
CREATE or replace TRIGGER trg_atualiza_encomenda
BEFORE UPDATE ON encomendas
FOR EACH ROW
EXECUTE FUNCTION trg_log_status_encomenda();