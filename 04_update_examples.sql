USE stockbrave;

-- 1) Ajustar nome de setor para ficar mais amigável
UPDATE SETOR
SET nome_setor = 'Petróleo e Combustíveis'
WHERE nome_setor = 'Energia';

-- 2) Corrigir o tipo de ativo da TAESA, se quiser padronizar
UPDATE ATIVO
SET tipo_ativo = 'Ação'
WHERE nome_ativo LIKE '%TAESA%';

-- 3) Atualizar um indicador específico (ex.: corrigir PL de um relatório da VALE)
UPDATE HISTORICO_INDICADORES h
JOIN ATIVO a ON a.id_ativo = h.id_ativo
SET h.pl = 7.30
WHERE a.nome_ativo LIKE '%VALE ON%'
  AND h.data_relatorio = '2024-06-30';
