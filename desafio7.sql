
SELECT a.artista AS artista,
    al.album AS album,
    COUNT(s.seguidores_id) AS seguidores
    FROM 
    SpotifyClone.artistas AS a
    INNER JOIN SpotifyClone.albuns AS al
    ON a.artista_id = al.artista_id
    INNER JOIN SpotifyClone.seguidores AS s
    ON al.artista_id = s.artista_id
    GROUP BY a.artista, al.album
    ORDER BY seguidores DESC, a.artista, al.album;