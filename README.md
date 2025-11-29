# Projeto StockBrave – Banco de Dados Relacional para Análise de Indicadores Financeiros

**(Disciplina: Modelagem de Banco de Dados – Projeto SQL)**

## Descrição Geral

O projeto **StockBrave** consiste no desenvolvimento de um banco de dados relacional voltado à análise de indicadores financeiros de empresas listadas em bolsa. O objetivo é organizar setores, ativos e seus históricos trimestrais de indicadores, permitindo consultas estruturadas que auxiliem na interpretação dos dados.

O repositório contém scripts SQL completos, organizados em módulos independentes, incluindo:

*   criação do banco e tabelas;
*   inserção de dados iniciais;
*   consultas `SELECT` para análise;
*   comandos `UPDATE` e `DELETE`;
*   documentação para execução.

## Estrutura do Repositório

```
StockBrave/
├── 01_create_database.sql (contém a criação das tabelas e todo o bloco de INSERTs)
├── 02_insert_data.sql (o conteúdo já está incluído no script 01)
├── 03_select_evolucao_indicadores.sql
├── 03_select_variacao_percentual.sql
├── 03_select_media_margem_setor.sql
├── 03_select_ranking_roe.sql
├── 04_update_examples.sql
└── 05_delete_examples.sql
```

## Requisitos

Para execução completa do projeto é necessário:

*   **MySQL Server 8.0** ou superior
*   **MySQL Workbench** (ou outro cliente SQL compatível)
*   Acesso local ao terminal para execução via Git, caso deseje clonar o repositório

## Instruções de Execução

### 4.1. Clonando o Repositório

```bash
git clone https://github.com/SEU_USUARIO/StockBrave.git
```

Entre na pasta:

```bash
cd StockBrave
```

### 4.2. Executando os Scripts no MySQL Workbench

1.  Abra o MySQL Workbench.
2.  Execute os arquivos na seguinte ordem:
    a) `01_create_database.sql`
    b) `02_insert_data.sql`
    c) Scripts de `SELECT` conforme necessidade:
        *   `03_select_evolucao_indicadores.sql`
        *   `03_select_variacao_percentual.sql`
        *   `03_select_media_margem_setor.sql`
        *   `03_select_ranking_roe.sql`
    d) Scripts opcionais de manipulação:
        *   `04_update_examples.sql`
        *   `05_delete_examples.sql`

Todos os arquivos contêm comentários internos explicando sua função.

## Visão Geral dos Scripts

### 5.1. Script 01 – Criação do Banco e Tabelas

Inclui:

*   criação do banco `stockbrave`;
*   definição de tabelas (`SETOR`, `ATIVO`, `HISTORICO_INDICADORES`);
*   criação de chaves primárias e estrangeiras;
*   definição de integridade referencial.

### 5.2. Script 02 – Inserção de Dados

Inclui dados realistas para:

*   setores econômicos;
*   ativos da B3;
*   indicadores financeiros trimestrais.

### 5.3. Scripts 03 – Consultas SELECT

Contêm consultas que utilizam:

*   `JOIN` entre tabelas;
*   `ORDER BY`;
*   `WHERE`;
*   `LIMIT`;
*   funções analíticas (como `LAG`);
*   ordenações por setor, ativo e data.

**Exemplo:**

```sql
SELECT
    s.nome_setor,
    a.nome_ativo,
    h.data_relatorio,
    h.pl,
    h.roe
FROM
    HISTORICO_INDICADORES h
JOIN
    ATIVO a ON a.id_ativo = h.id_ativo
JOIN
    SETOR s ON s.id_setor = a.id_setor
ORDER BY
    s.nome_setor,
    a.nome_ativo,
    h.data_relatorio;
```

### 5.4. Script 04 – Comandos UPDATE

Contém três comandos `UPDATE` com cláusulas condicionais, utilizados para ajustes seletivos na base de dados.

**Exemplo:**

```sql
UPDATE
    SETOR
SET
    nome_setor = 'Petróleo e Combustíveis'
WHERE
    id_setor = 1;
```

### 5.5. Script 05 – Comandos DELETE

Contém três comandos `DELETE` com condições que evitam exclusões indesejadas.

**Exemplo:**

```sql
DELETE h
FROM
    HISTORICO_INDICADORES h
JOIN
    ATIVO a ON a.id_ativo = h.id_ativo
WHERE
    a.nome_ativo LIKE '%MAGAZINE LUIZA%'
    AND h.data_relatorio = '2024-06-30';
```

## Observações Importantes

Este repositório contempla todos os requisitos da entrega acadêmica:

*   criação e modelagem do banco;
*   povoamento das tabelas principais;
*   consultas `SELECT`;
*   comandos `UPDATE` e `DELETE`;
*   organização do conteúdo;
*   documentação detalhada.

Os valores utilizados nos registros são realistas, porém fictícios, adequados para fins de estudo e demonstração.

## Autor

| Campo | Valor |
| :--- | :--- |
| **Nome** | Rafael |
| **Curso** | Análise e Desenvolvimento de Sistemas |
| **Disciplina** | Modelagem de Banco de Dados |
| **Ano** | 2025 |
