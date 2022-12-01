DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS SpotifyClone.planos (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  valor DOUBLE NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    planos_id INT NOT NULL,
    data_cadastro DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (planos_id)
        REFERENCES SpotifyClone.planos(id)
)  ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artistas (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.albuns (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  artistas_id INT NOT NULL,
  data_lancamento YEAR NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (artistas_id)
    REFERENCES SpotifyClone.artistas(id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.musicas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao_musica INT NOT NULL,
    artistas_id INT NOT NULL,
    albuns_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (albuns_id)
        REFERENCES SpotifyClone.albuns(id),
	FOREIGN KEY (artistas_id)
		REFERENCES SpotifyClone.artistas(id)
)  ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS SpotifyClone.historico_reproducoes (
  usuarios_id INT NOT NULL,
  musicas_id INT NOT NULL,
  data_reproducoes DATETIME NOT NULL,
  PRIMARY KEY (usuarios_id, musicas_id),
  FOREIGN KEY (usuarios_id)
    REFERENCES SpotifyClone.usuarios(id),
  FOREIGN KEY (musicas_id)
    REFERENCES SpotifyClone.musicas(id)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.seguindo (
    usuarios_id INT NOT NULL,
    artistas_id INT NOT NULL,
    PRIMARY KEY (usuarios_id, artistas_id),
    FOREIGN KEY (usuarios_id)
        REFERENCES SpotifyClone.usuarios(id),
    FOREIGN KEY (artistas_id)
        REFERENCES SpotifyClone.artistas(id)
)  ENGINE = INNODB;

INSERT INTO SpotifyClone.planos (nome, valor)
  VALUES
    ('gratuito', 0.00),
    ('pessoal', 6.99),
    ('universitário', 5.99),
    ('familiar', 7.99);
  
  INSERT INTO SpotifyClone.usuarios (nome, idade, data_cadastro, planos_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 4),
    ('Martin Fowler', 46, '2017-01-17', 4),
    ('Sandi Metz', 58, '2018-04-29', 4),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 2),
    ('Judith Butler', 45, '2020-05-13', 2),
    ('Jorge Amado', 58, '2017-02-17', 2);

      INSERT INTO SpotifyClone.artistas (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

      INSERT INTO SpotifyClone.albuns (nome, data_lancamento, artistas_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

      INSERT INTO SpotifyClone.musicas (nome, duracao_musica, albuns_id, artistas_id)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ("VIRGO'S GROOVE", 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ("Don't Stop Me Now", 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ("The Bard's Song", 244, 7, 5),
    ('Feeling Good', 100, 8, 6);

    INSERT INTO SpotifyClone.historico_reproducoes (usuarios_id, musicas_id, data_reproducoes)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
  	(1, 2, '2020-05-02 05:30:35'),
   	(1, 10, '2020-03-06 11:22:33'),
  	(2, 10, '2022-08-05 08:05:17'),
  	(2, 7, '2020-01-02 07:40:33'),
  	(3, 10, '2020-11-13 16:55:13'),
  	(3, 2, '2020-12-05 18:38:30'),
  	(4, 8, '2021-08-15 17:10:10'),
  	(5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
   	(6, 1, '2017-10-12 12:35:20'),
  	(7, 4, '2011-12-15 22:30:49'),
  	(8, 4, '2012-03-17 14:56:41'),
  	(9, 9, '2022-02-24 21:14:22'),
  	(10, 3, '2015-12-13 08:30:22');

      INSERT INTO SpotifyClone.seguindo (usuarios_id, artistas_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);