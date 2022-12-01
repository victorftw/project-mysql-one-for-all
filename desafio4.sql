SELECT DISTINCT
    u.nome AS usuario,
    IF(YEAR(MAX(h.data_reproducoes)) < 2021,
        'Usuário inativo',
        'Usuário ativo') AS status_usuario
FROM
    SpotifyClone.historico_reproducoes AS h
        INNER JOIN
    SpotifyClone.usuarios AS u ON h.usuarios_id = u.id
GROUP BY usuario
ORDER BY usuario