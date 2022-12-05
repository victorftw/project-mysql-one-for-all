SELECT 
    art.nome AS artista,
    alb.nome AS album,
    COUNT(s.usuarios_id) AS seguidores
FROM
    SpotifyClone.artistas AS art
        INNER JOIN
    SpotifyClone.albuns AS alb ON art.id = alb.artistas_id
        INNER JOIN
    SpotifyClone.seguindo AS s ON s.artistas_id = art.id
GROUP BY art.nome , alb.nome
ORDER BY seguidores DESC , art.nome ASC , alb.nome ASC