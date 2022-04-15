SELECT 
	u.name AS usuario,
    COUNT(mo.usuario_id) AS qtde_musicas_ouvidas,
    FORMAT(SUM(tm.duracao_segundos)/60, 2) AS total_minutos
    FROM 
    SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico AS mo
    ON u.usuario_id = mo.usuario_id
    INNER JOIN SpotifyClone.musicas AS tm
    ON tm.musicas_id = mo.musicas_id
    GROUP BY u.name;

/* Link usado para conhecimento da função FORMAT: https://acervolima.com/funcao-format-no-sql-server/ */