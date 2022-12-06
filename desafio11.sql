SELECT *
FROM (
    SELECT REPLACE(nome, '\'', '’') AS nome_musica,
        CASE
            WHEN nome LIKE '%Bard%' THEN REPLACE(REPLACE(nome, '\'', '’'), 'Bard', 'QA')
            WHEN nome LIKE '%Amar%' THEN REPLACE(nome, 'Amar', 'Code Review')
            WHEN nome LIKE '%Pais%' THEN REPLACE(nome, 'Pais', 'Pull Requests')
            WHEN nome LIKE '%SOUL%' THEN REPLACE(nome, 'SOUL', 'CODE')
            WHEN nome LIKE '%SUPERSTAR%' THEN REPLACE(nome, 'SUPERSTAR', 'SUPERDEV')
        END AS novo_nome
    FROM SpotifyClone.musicas
) AS subquery
WHERE novo_nome IS NOT NULL
ORDER BY nome_musica DESC