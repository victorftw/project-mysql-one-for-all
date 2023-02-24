SELECT 
    usr.nome AS usuario,
    COUNT(h.usuarios_id) AS qt_de_musicas_ouvidas,
    SUM(ROUND(m.duracao_musica/60, 2)) as total_minutos
FROM
    SpotifyClone.usuarios as usr
INNER JOIN SpotifyClone.historico_reproducoes AS h ON usr.id = h.usuarios_id
INNER JOIN SpotifyClone.musicas AS m ON m.id = h.musicas_id
GROUP BY usuario ORDER BY usuario ASC;
