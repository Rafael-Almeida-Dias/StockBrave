SELECT 
	s.nome_setor,
	a.nome_ativo,
    h.data_relatorio,
    h.pl,
    h.roe,
    h.divida_liquida_pl,
    h.margem_liquida,
    h.crescimento_receita
FROM HISTORICO_INDICADORES h
JOIN ATIVO a ON a.id_ativo = h.id_ativo
JOIN SETOR s ON s.id_setor = a.id_setor
ORDER BY s.nome_setor, a.nome_ativo, h.data_relatorio;
