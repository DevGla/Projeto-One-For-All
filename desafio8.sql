SELECT 
	a.artista AS artista,
    al.album AS album
    FROM 
    SpotifyClone.artistas AS a
    INNER JOIN SpotifyClone.albuns AS al
    ON a.artista_id = al.artista_id AND a.artista = "Walter Phoenix";