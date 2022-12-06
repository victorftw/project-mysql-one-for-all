SELECT 
    REPLACE(m.nome, '\'', '’') AS nome, COUNT(m.id) AS reproducoes
FROM
    SpotifyClone.musicas AS m
        INNER JOIN
    SpotifyClone.historico_reproducoes AS h ON m.id = h.musicas_id
        INNER JOIN
    SpotifyClone.usuarios AS u ON u.id = h.usuarios_id
WHERE
    u.planos_id = 1 OR u.planos_id = 2
GROUP BY m.id
ORDER BY nome