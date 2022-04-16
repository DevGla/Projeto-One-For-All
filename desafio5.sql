SELECT 
	m.musica AS cancao,
    COUNT(h.musicas_id) AS reproducoes
    FROM 
    SpotifyClone.musicas AS m
    INNER JOIN SpotifyClone.historico AS h
    ON m.musicas_id = h.musicas_id
    GROUP BY m.musica
    HAVING reproducoes = 2 LIMIT 2;