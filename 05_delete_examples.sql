USE stockbrave;

-- 1) Apagar um histórico específico da MAGAZINE LUIZA em um trimestre
DELETE h
FROM HISTORICO_INDICADORES h
JOIN ATIVO a ON a.id_ativo = h.id_ativo
WHERE a.nome_ativo LIKE '%MAGAZINE LUIZA%'
  AND h.data_relatorio = '2024-06-30';

-- 2) Apagar todos os históricos de um ativo de teste (Caso fosse criado um ATIVO 'TESTE')
DELETE h
FROM HISTORICO_INDICADORES h
JOIN ATIVO a ON a.id_ativo = h.id_ativo
WHERE a.nome_ativo LIKE '%TESTE%';

-- 3) Apagar o próprio ativo de teste
DELETE FROM ATIVO
WHERE nome_ativo LIKE '%TESTE%';
