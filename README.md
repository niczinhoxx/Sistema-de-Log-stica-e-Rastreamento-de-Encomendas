# Sistema de Logística e Rastreamento de Encomendas

# LogiTrack — Sistema de Logística e Rastreamento em Tempo Real

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15%2B-blue.svg)](https://www.postgresql.org/)
[![PL/pgSQL](https://img.shields.io/badge/Language-PL%2FpgSQL-lightgrey.svg)](https://www.postgresql.org/docs/current/plpgsql.html)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

O **LogiTrack** é uma arquitetura de banco de dados relacional desenvolvida em **PostgreSQL** projetada para gerenciar operações de logística, rastreamento de encomendas e auditoria automática de status em tempo real.

O projeto foi construído focando em boas práticas de engenharia de dados, integridade referencial, automação via triggers/funções armazenadas (PL/pgSQL) e otimização de consultas para cenários de alta volumetria.

---

## 📌 Principais Funcionalidades

- **Identificação Segura (UUIDs):** Utilização de `UUID v4` como chave primária para prevenir varreduras maliciosas e enumeração de dados (*ID Enumeration Attacks*).
- **Auditoria Automática via Triggers:** Sistema de logs automatizado onde qualquer alteração no status de uma encomenda registra instantaneamente o histórico anterior, novo status e timestamp sem necessidade de código na camada de aplicação.
- **Garantia de Integridade de Dados:** Constraints de validação (`CHECK constraints`) para controlar status permitidos e garantir valores consistentes (ex: peso positivo).
- **Otimização de Performance:** Criação de índices B-Tree em colunas de alta frequência de busca (código de rastreio e chaves estrangeiras).
- **Consultas Analíticas Avançadas:** Uso de **CTEs (Common Table Expressions)** e **Window Functions (`ROW_NUMBER()`)** para gerar linhas do tempo e relatórios gerenciais performáticos.

---

## 📁 Estrutura do Repositório

O repositório está organizado em scripts SQL modulares para facilitar o versionamento, manutenção e implantação:

```text
.
├── base.sql                # Criação das extensões, tabelas, chaves e constraints
├── automacoes.sql          # Stored Procedures, Functions e Triggers em PL/pgSQL
├── insercao_dados.sql      # Carga inicial de dados para ambiente de testes
├── atualizacoes.sql        # Simulação de eventos e alterações de status de encomendas
├── indicies.sql            # Criação de índices B-Tree para otimização de buscas
└── consulta_de_dados.sql   # Queries analíticas, CTEs, Window Functions e EXPLAIN ANALYZE

👨‍💻 Autor
Desenvolvido por Nicolas da Silva Floriano

Graduando em Análise e Desenvolvimento de Sistemas | Foco em Back-End e Banco de Dados.

LinkedIn: https://www.linkedin.com/in/nicolas-da-silva-floriano-a55b632b9/

Email: devnicolassilva@gmail.com
