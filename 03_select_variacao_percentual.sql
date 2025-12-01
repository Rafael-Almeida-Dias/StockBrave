SELECT 
    a.nome_ativo,
    h.data_relatorio,

    -- INDICADORES ATUAIS
    h.pl,
    h.roe,
    h.divida_liquida_pl,
    h.margem_liquida,
    h.crescimento_receita,

    -- VALORES ANTERIORES
    LAG(h.pl)                  OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio) AS pl_anterior,
    LAG(h.roe)                 OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio) AS roe_anterior,
    LAG(h.divida_liquida_pl)   OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio) AS divliqpl_anterior,
    LAG(h.margem_liquida)      OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio) AS margem_anterior,
    LAG(h.crescimento_receita) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio) AS cresc_rec_anterior,

    -- VARIAÇÃO ABSOLUTA
    (h.pl - LAG(h.pl) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) AS variacao_pl,
    (h.roe - LAG(h.roe) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) AS variacao_roe,
    (h.divida_liquida_pl - LAG(h.divida_liquida_pl) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) AS variacao_divliqpl,
    (h.margem_liquida - LAG(h.margem_liquida) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) AS variacao_margem,
    (h.crescimento_receita - LAG(h.crescimento_receita) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) AS variacao_crescrec,

    -- VARIAÇÃO PERCENTUAL (%)
    ((h.pl / LAG(h.pl) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) - 1) * 100 AS variacao_pl_pct,
    ((h.roe / LAG(h.roe) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) - 1) * 100 AS variacao_roe_pct,
    ((h.divida_liquida_pl / LAG(h.divida_liquida_pl) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) - 1) * 100 AS variacao_divliqpl_pct,
    ((h.margem_liquida / LAG(h.margem_liquida) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) - 1) * 100 AS variacao_margem_pct,
    ((h.crescimento_receita / LAG(h.crescimento_receita) OVER (PARTITION BY h.id_ativo ORDER BY h.data_relatorio)) - 1) * 100 AS variacao_cresc_rec_pct

FROM HISTORICO_INDICADORES h
JOIN ATIVO a ON a.id_ativo = h.id_ativo
ORDER BY a.nome_ativo, h.data_relatorio;
