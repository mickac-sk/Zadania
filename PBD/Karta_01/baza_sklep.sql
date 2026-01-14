-- Utworzenie bazy
CREATE DATABASE IF NOT EXISTS Sklep;
USE Sklep;

-- 1. Tabela PRODUCENCI
CREATE TABLE IF NOT EXISTS producenci (
  IDProducenci int(11) NOT NULL AUTO_INCREMENT,
  Nazwa varchar(50) DEFAULT NULL,
  URL varchar(50) DEFAULT NULL,
  PRIMARY KEY (IDProducenci)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO producenci (IDProducenci, Nazwa, URL) VALUES
(1, 'Intel', 'intel.com'),
(2, 'AMD', 'amd.com');

-- 2. Tabela ARTYKULY
CREATE TABLE IF NOT EXISTS artykuly (
  IDArtykuly int(11) NOT NULL AUTO_INCREMENT,
  ProducenciID int(11) NOT NULL,
  Model varchar(50) DEFAULT NULL,
  Typ varchar(50) DEFAULT NULL,
  Cena decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (IDArtykuly),
  KEY fk_producent (ProducenciID),
  CONSTRAINT fk_producent FOREIGN KEY (ProducenciID) REFERENCES producenci (IDProducenci)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO artykuly (IDArtykuly, ProducenciID, Model, Typ, Cena) VALUES
(1, 1, 'Core i5-12400F', 'Procesor', 850.00),
(2, 1, 'Core i9-13900K', 'Procesor', 2900.00),
(3, 2, 'Ryzen 5 5600', 'Procesor', 650.00),
(4, 2, 'Ryzen 7 5800X3D', 'Procesor', 1400.00);

-- 3. Tabela MAGAZYN
CREATE TABLE IF NOT EXISTS magazyn (
  IDMagazyn int(11) NOT NULL,
  Ilosc int(11) DEFAULT 0,
  Lokalizacja varchar(10) DEFAULT 'A-01',
  PRIMARY KEY (IDMagazyn),
  CONSTRAINT fk_artykul_magazyn FOREIGN KEY (IDMagazyn) REFERENCES artykuly (IDArtykuly)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO magazyn (IDMagazyn, Ilosc, Lokalizacja) VALUES
(1, 50, 'A-10'),
(2, 0, 'B-05'),
(3, 12, 'A-11'),
(4, 5, 'B-06');
