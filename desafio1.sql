DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(100) NOT NULL,
    valor_plano DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    idade TINYINT NOT NULL,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id),
    data_assinatura DATE
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT AUTO_INCREMENT KEY,
    artista VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(100) NOT NULL,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    ano_lancamento YEAR
) engine = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musicas_id INT AUTO_INCREMENT PRIMARY KEY,
    musica VARCHAR(100) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id),
    duracao_segundos INT
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(    
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    data_reproducao DATETIME,
    musicas_id INT,
    FOREIGN KEY (musicas_id) REFERENCES musicas(musicas_id),
    historico_id INT,
    CONSTRAINT historico_id PRIMARY KEY(usuario_id, musicas_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidores(
    seguidores_id INT AUTO_INCREMENT NOT NULL,
    usuario_id INT,
    artista_id INT,
    CONSTRAINT seguidores_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    CONSTRAINT seguidores_artista FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
    PRIMARY KEY (seguidores_id, usuario_id, artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_id, plano, valor_plano )
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitario', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.usuarios (usuario_id, `name`, idade, plano_id, data_assinatura  )
VALUES
  (1, 'Thati', 23, 1, '2019-10-20'),
  (2, 'Cintia', 35, 2, '2017-12-30'),
  (3, 'Bill', 20, 3, '2019-06-05'),
  (4, 'Roger', 45, 4, '2020-05-13'),
  (5, 'Norman', 58, 4, '2017-02-17'),
  (6, 'Patrick', 33, 2, '2017-01-06'),
  (7, 'Vivian', 26, 3, '2018-01-05'),
  (8, 'Carol', 19, 3, '2018-02-14'),
  (9, 'Angelina', 42, 2, '2018-04-29'),
  (10, 'Paul', 46, 2, '2017-01-17');

  
INSERT INTO SpotifyClone.artistas (artista_id, artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon'),
  (5, 'Tyler Isle'),
  (6, 'Fog');

INSERT INTO SpotifyClone.albuns (album_id, album, artista_id, ano_lancamento)
VALUES
  (1, 'Envious', 1 , 1990),
  (2, 'Exuberant', 1, 1993),
  (3, 'Hallowed Steam', 2, 1995),
  (4, 'Incandescent', 3, 1998),
  (5, 'Temporary Culture', 4, 2001),
  (6, 'Library of liberty', 4, 2003),
  (7, 'Chained Down', 5, 2007),
  (8, 'Cabinet of fools', 5, 2012),
  (9, 'No guarantees', 5, 2015),
  (10, 'Apparatus', 6, 2015);

INSERT INTO SpotifyClone.musicas (musicas_id, musica, album_id, duracao_segundos)
VALUES
  (1, 'Soul For US', 1, 200),
  (2, 'Reflections Of Magic', 1, 163),
  (3, 'Dance With Her Own', 1, 116),
  (4, 'Troubles Of My Inner Fire', 2, 203),
  (5, 'Time Fireworks', 2, 152),
  (6, 'Magic Circus', 3, 105),
  (7, 'Honey, so do i', 3, 207),
  (8, 'Sweetie, lets go wild', 3, 139),
  (9, 'She knows', 3, 244),
  (10, 'Fantasy for me', 4, 100),
  (11, 'Celebration of more', 4, 146),
  (12, 'Rock his everything', 4, 223),
  (13, 'Home forever', 4, 231),
  (14, 'Diamond Power', 4, 241),
  (15, 'Lets be silly', 4, 132),
  (16, 'Thang of thunder', 5, 240),
  (17, 'Words of her life', 5, 185),
  (18, 'Without my streets', 5, 176),
  (19, 'Need of the evening', 6, 190),
  (20, 'History of my roses', 6, 222),
  (21, 'Without my love', 6, 111),
  (22, 'walking and game', 6, 123),
  (23, 'Young and father', 6, 197),
  (24, 'Finding my traditions', 7, 179),
  (25, 'Walking and man', 7, 229),
  (26, 'Hard and time', 7, 135),
  (27, 'Honey, im a lone wolf', 7, 150),
  (28, 'She thinks i wont stay tonight', 8, 166),
  (29, 'He heard you are bad for me', 8, 154),
  (30, 'He hopes we cant stay', 8, 210),
  (31, 'I know i know', 8, 117),
  (32, 'He is walking away', 9, 159),
  (33, 'He is trouble', 9, 138),
  (34, 'I heard i want to bo alone', 9, 120),
  (35, 'I ride alone', 10, 151),
  (36, 'Honey', 10, 79),
  (37, 'You cheated on me', 10, 95),
  (38, 'Wouldnt it be nice', 10, 213),
  (39, 'Baby', 10, 136),
  (40, 'You make me feel so...', 10, 83);
  

INSERT INTO SpotifyClone.historico (historico_id, usuario_id, musicas_id, data_reproducao)
VALUES
  (1, 1, 36, '2020-02-28 10:45:55'),
  (2, 1, 25, '2020-05-02 05:30:35'),
  (3, 1, 23, '2020-03-06 11:22:33'),
  (4, 1, 14, '2020-08-05 08:05:17'),
  (5, 1, 15, '2020-09-14 16:32:22'),
  (6, 2, 34, '2020-01-02 07:40:33'),
  (7, 2, 24, '2020-05-16 06:16:22'),
  (8, 2, 21, '2020-10-09 12:27:48'),
  (9, 2, 39, '2020-09-21 13:14:46'),
  (10, 3, 6, '2020-11-13 16:55:13'),
  (11, 3, 3, '2020-12-05 18:38:30'),
  (12, 3, 26, '2020-07-30 10:00:00'),
  (13, 4, 2, '2020-08-15 17:10:10'),
  (14, 4, 35, '2021-07-10 15:20:30'),
  (15, 4, 27, '2021-01-09 01:44:33'),
  (16, 5, 7, '2020-07-03 19:33:28'),
  (17, 5, 12, '2017-02-24 21:14:22'),
  (18, 5, 14, '2020-08-06 15:23:43'),
  (19, 5, 1, '2020-11-10 13:52:27'),
  (20, 6, 38, '2019-02-07 20:33:48'),
  (21, 6, 29, '2017-01-24 00:31:17'),
  (22, 6, 30, '2017-10-12 12:35:20'),
  (23, 6, 22, '2018-05-29 14:56:41'),
  (24, 7, 5, '2018-05-09 22:30:49'),
  (25, 7, 4, '2020-07-27 12:52:58'),
  (26, 7, 11, '2018-01-16 18:40:43'),
  (27, 8, 39, '2018-03-21 16:56:40'),
  (28, 8, 40, '2020-10-18 13:38:05'),
  (29, 8, 32, '2019-05-25 08:14:03'),
  (30, 8, 33, '2021-08-15 21:37:09'),
  (31, 9, 16, '2021-05-24 17:23:45'),
  (32, 9, 17, '2018-12-07 22:48:52'),
  (33, 9, 8, '2021-03-14 06:14:26'),
  (34, 9, 9, '2020-04-01 03:36:00'),
  (35, 10, 20, '2017-02-06 08:21:34'),
  (36, 10, 21, '2017-12-04 05:33:43'),
  (37, 10, 12, '2017-07-27 05:24:49'),
  (38, 10, 13, '2017-12-25 01:03:57');

INSERT INTO SpotifyClone.seguidores(seguidores_id, usuario_id, artista_id)
VALUES
  (1, 1, 1),
  (2, 1, 4),
  (3, 1, 3),
  (4, 2, 1),
  (5, 2, 3),
  (6, 3, 2),
  (7, 3, 1),
  (8, 4, 4),
  (9, 5, 5),
  (10, 5, 6),
  (11, 6, 6),
  (12, 6, 3),
  (13, 6, 1),
  (14, 7, 2),
  (15, 7, 5),
  (16, 8, 1),
  (17, 8, 5),
  (18, 9, 6),
  (19, 9, 4),
  (20, 9, 3),
  (21, 10, 2),
  (22, 10, 6);

