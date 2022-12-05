SELECT 
    COUNT(u.nome) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.usuarios AS u
        INNER JOIN
    SpotifyClone.historico_reproducoes AS h ON u.id = h.usuarios_id
WHERE
    h.usuarios_id = 1