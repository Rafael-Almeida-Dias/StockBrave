SELECT 
    a.nome_ativo,
    AVG(h.roe) AS roe_medio
FROM HISTORICO_INDICADORES h
JOIN ATIVO a ON a.id_ativo = h.id_ativo
GROUP BY a.nome_ativo
ORDER BY roe_medio DESC;
