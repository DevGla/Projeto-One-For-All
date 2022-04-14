SELECT 
	COUNT(DISTINCT c.musicas_id) AS cancoes,
    COUNT(DISTINCT ar.artista_id) AS artistas,
    COUNT(DISTINCT a.album_id) AS albuns
    FROM 
    SpotifyClone.musicas AS c,
    SpotifyClone.artistas AS ar,
    SpotifyClone.albuns AS a;
