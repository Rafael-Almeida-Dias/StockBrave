SELECT 
    s.nome_setor,
    AVG(h.margem_liquida) AS margem_media
FROM HISTORICO_INDICADORES h
JOIN ATIVO a ON h.id_ativo = a.id_ativo
JOIN SETOR s ON a.id_setor = s.id_setor
GROUP BY s.nome_setor;
