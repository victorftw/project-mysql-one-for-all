SELECT 
    COUNT(nome) AS cancoes,
    COUNT(DISTINCT artistas_id) AS artistas,
    COUNT(DISTINCT albuns_id) AS albuns
FROM
    SpotifyClone.musicas;