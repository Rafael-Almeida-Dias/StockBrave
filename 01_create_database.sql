/* ============================================================
   PROJETO STOCKBRAVE – SCRIPT PRINCIPAL
   Criação completa do banco de dados + carga inicial
   ============================================================ */

-- Remove banco anterior
DROP DATABASE IF EXISTS stockbrave;

-- Cria o banco com charset correto
CREATE DATABASE stockbrave
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE stockbrave;

/* ============================================================
   1. TABELA SETOR
   ============================================================ */

CREATE TABLE SETOR (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome_setor VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;


/* ============================================================
   2. TABELA ATIVO
   ============================================================ */

CREATE TABLE ATIVO (
    id_ativo INT AUTO_INCREMENT PRIMARY KEY,
    nome_ativo VARCHAR(150) NOT NULL,
    bolsa VARCHAR(50),
    tipo_ativo VARCHAR(50),
    id_setor INT NOT NULL,

    CONSTRAINT fk_ativo_setor
        FOREIGN KEY (id_setor)
        REFERENCES SETOR(id_setor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


/* ============================================================
   3. TABELA HISTÓRICO DE INDICADORES
   ============================================================ */

CREATE TABLE HISTORICO_INDICADORES (
    id_hist INT AUTO_INCREMENT PRIMARY KEY,
    id_ativo INT NOT NULL,
    data_relatorio DATE NOT NULL,

    pl DECIMAL(10,2),
    roe DECIMAL(10,2),
    divida_liquida_pl DECIMAL(10,2),
    margem_liquida DECIMAL(10,2),
    crescimento_receita DECIMAL(10,2),

    CONSTRAINT fk_hist_ativo
        FOREIGN KEY (id_ativo)
        REFERENCES ATIVO(id_ativo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_hist UNIQUE (id_ativo, data_relatorio)
) ENGINE=InnoDB;


/* ============================================================
   4. INSERÇÃO DE SETORES
   ============================================================ */

INSERT INTO SETOR (nome_setor) VALUES
  ('Petróleo e Combustíveis'),         -- 1 - PETROBRAS
  ('Bancos e Bolsa de Valores'),       -- 2 - ITAÚ, B3
  ('Mineração e Metais'),              -- 3 - VALE
  ('Alimentos e Bebidas'),             -- 4 - AMBEV
  ('Lojas e Comércio (Varejo)'),       -- 5 - MAGALU
  ('Energia Elétrica e Transmissão'),  -- 6 - TAESA
  ('Indústria e Máquinas');            -- 7 - WEG



/* ============================================================
   5. INSERÇÃO DE ATIVOS
   ============================================================ */

INSERT INTO ATIVO (nome_ativo, bolsa, tipo_ativo, id_setor) VALUES
  ('PETROBRAS PN (PETR4)',       'B3', 'Ação',        1),
  ('TAESA UNT (TAEE11)',         'B3', 'Ação/Unit',   6),
  ('ITAÚ UNIBANCO PN (ITUB4)',   'B3', 'Ação',        2),
  ('B3 ON (B3SA3)',              'B3', 'Ação',        2),
  ('VALE ON (VALE3)',            'B3', 'Ação',        3),
  ('AMBEV ON (ABEV3)',           'B3', 'Ação',        4),
  ('MAGAZINE LUIZA ON (MGLU3)',  'B3', 'Ação',        5),
  ('WEG ON (WEGE3)',             'B3', 'Ação',        7);


/* ============================================================
   6. INSERÇÃO DE HISTÓRICO DE INDICADORES
   ============================================================ */

INSERT INTO HISTORICO_INDICADORES (
    id_ativo, data_relatorio,
    pl, roe, divida_liquida_pl,
    margem_liquida, crescimento_receita
) VALUES

  -- PETROBRAS PN (1)
  (1, '2024-03-31', 5.80, 19.50, 0.85, 14.20,  7.30),
  (1, '2024-06-30', 6.10, 20.10, 0.80, 15.00,  8.10),
  (1, '2024-09-30', 5.90, 19.80, 0.82, 14.70,  6.90),

  -- TAESA (2)
  (2, '2024-03-31', 13.50, 18.20, 1.10, 32.00,  4.50),
  (2, '2024-06-30', 14.10, 18.80, 1.05, 33.10,  5.20),

  -- ITAÚ UNIBANCO (3)
  (3, '2024-03-31',  9.80, 20.50, 0.60, 22.30,  9.10),
  (3, '2024-06-30', 10.20, 21.10, 0.58, 23.00,  8.70),
  (3, '2024-09-30',  9.90, 20.80, 0.57, 22.60,  7.90),

  -- B3 (4)
  (4, '2024-03-31', 12.40, 17.30, 0.40, 28.50,  6.20),
  (4, '2024-06-30', 11.90, 17.80, 0.38, 29.10,  6.80),

  -- VALE (5)
  (5, '2024-03-31',  7.20, 16.40, 0.55, 18.90,  5.40),
  (5, '2024-06-30',  7.60, 17.10, 0.53, 19.50,  6.10),
  (5, '2024-09-30',  7.10, 16.70, 0.54, 19.00,  4.90),

  -- AMBEV (6)
  (6, '2024-03-31', 15.30, 14.20, 0.30, 19.80,  4.00),
  (6, '2024-06-30', 15.80, 14.70, 0.29, 20.10,  4.60),

  -- MAGAZINE LUIZA (7)
  (7, '2024-03-31', 42.00,  5.50, 1.90,  3.20,  9.80),
  (7, '2024-06-30', 39.00,  6.10, 1.85,  3.60, 10.40),

  -- WEG (8)
  (8, '2024-03-31', 28.50, 21.80, 0.20, 18.50,  8.00),
  (8, '2024-06-30', 29.10, 22.30, 0.19, 18.90,  8.70),
  (8, '2024-09-30', 28.70, 22.00, 0.19, 18.70,  7.90);


