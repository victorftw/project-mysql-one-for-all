SELECT 
    CONVERT(FORMAT(MIN(p.valor), 2), char) AS faturamento_minimo,
    CONVERT(MAX(p.valor), char) AS faturamento_maximo,
    CONVERT(ROUND(AVG(p.valor), 2), char) AS faturamento_medio,
    CONVERT(ROUND(SUM(p.valor), 2), char) AS faturamento_total
FROM
    SpotifyClone.usuarios AS a
        INNER JOIN
    SpotifyClone.planos AS p ON a.planos_id = p.id