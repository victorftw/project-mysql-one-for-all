SELECT 
    m.nome AS cancao, COUNT(h.musicas_id) AS reproducoes
FROM
    SpotifyClone.historico_reproducoes AS h
        INNER JOIN
    SpotifyClone.musicas AS m ON m.id = h.musicas_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2