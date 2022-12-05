SELECT 
    art.nome AS artista, alb.nome AS album
FROM
    SpotifyClone.artistas AS art
        INNER JOIN
    SpotifyClone.albuns AS alb ON art.id = alb.artistas_id
WHERE
    art.nome = 'Elis Regina'