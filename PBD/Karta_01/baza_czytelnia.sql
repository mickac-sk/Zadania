-- Utworzenie bazy
CREATE DATABASE IF NOT EXISTS Czytelnia;
USE Czytelnia;

-- 1. Tabela AUTORZY
CREATE TABLE IF NOT EXISTS autorzy (
  IDAutor int(11) NOT NULL AUTO_INCREMENT,
  Imie varchar(50) DEFAULT NULL,
  Nazwisko varchar(50) DEFAULT NULL,
  PRIMARY KEY (IDAutor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO autorzy (IDAutor, Imie, Nazwisko) VALUES
(1, 'Henryk', 'Sienkiewicz'),
(2, 'Stanisław', 'Lem'),
(3, 'Adam', 'Mickiewicz');

-- 2. Tabela KSIAZKI
CREATE TABLE IF NOT EXISTS ksiazki (
  IDKsiazki int(11) NOT NULL AUTO_INCREMENT,
  AutorID int(11) NOT NULL,
  Tytul varchar(100) DEFAULT NULL,
  Wydawnictwo varchar(50) DEFAULT NULL,
  RokWydania int(4) DEFAULT NULL,
  PRIMARY KEY (IDKsiazki),
  KEY fk_autor (AutorID),
  CONSTRAINT fk_autor FOREIGN KEY (AutorID) REFERENCES autorzy (IDAutor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ksiazki (IDKsiazki, AutorID, Tytul, Wydawnictwo, RokWydania) VALUES
(1, 1, 'W pustyni i w puszczy', 'Greg', 2010),
(2, 2, 'Solaris', 'Wydawnictwo Literackie', 1961),
(3, 2, 'Cyberiada', 'Wydawnictwo Literackie', 1965),
(4, 2, 'Fiasko', 'Wydawnictwo Literackie', 1987),
(5, 3, 'Pan Tadeusz', 'Ossolineum', 1999);

-- 3. Tabela EGZEMPLARZE
CREATE TABLE IF NOT EXISTS egzemplarze (
  IDEgzemplarz int(11) NOT NULL AUTO_INCREMENT,
  KsiazkaID int(11) NOT NULL,
  Sygnatura varchar(20) DEFAULT NULL,
  DoWypozyczenia tinyint(1) DEFAULT 1,
  Stan varchar(20) DEFAULT 'Dobry',
  PRIMARY KEY (IDEgzemplarz),
  KEY fk_ksiazka (KsiazkaID),
  CONSTRAINT fk_ksiazka FOREIGN KEY (KsiazkaID) REFERENCES ksiazki (IDKsiazki)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO egzemplarze (IDEgzemplarz, KsiazkaID, Sygnatura, DoWypozyczenia) VALUES
(1, 1, 'S/01/20', 1),
(2, 2, 'L/05/61', 0),
(3, 4, 'L/09/87', 1),
(4, 5, 'M/02/99', 1);
