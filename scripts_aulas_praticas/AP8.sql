CREATE DATABASE futebolDB;
USE futebolDB;

CREATE TABLE Futebol (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30),
    Estado VARCHAR(2),
    Brasileirao INT,
    CopaDoBrasil INT,
    Estadual INT
);

INSERT Futebol 
VALUES
(0, "Palmeiras", "SP", 9, 3, 23),
(0, "Santos", "SP", 8, 1, 21),
(0, "Corinthians", "SP", 7, 3, 27),
(0, "Sao Paulo", "SP", 6, 0, 21),
(0, "Flamengo", "RJ", 5, 3, 33),
(0, "Cruzeiro", "MG", 4, 5, 37),
(0, "Vasco", "RJ", 4, 1, 23),
(0, "Internacional", "RS", 3, 1, 44),
(0, "Gremio", "RS", 2, 5, 36);

DESCRIBE Futebol;
SELECT * FROM Futebol;