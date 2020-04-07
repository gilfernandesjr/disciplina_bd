CREATE DATABASE IF NOT EXISTS restaurante
	DEFAULT CHARSET = latin1
    DEFAULT COLLATE = latin1_general_ci;
    
USE restaurante;

CREATE TABLE receitas (
	Prato VARCHAR(30) NOT NULL,
    Tempo INT NOT NULL,
    Ingredientes VARCHAR(200) NOT NULL
);

INSERT receitas VALUES
("Yakssoba", 40, "espaguete, cebola, óleo, brócolis, couve-flor, molho de soja, carne, cenoura, acelga"), 
("strogonoff de carne", 30, "carne, cebola, champignon, creme de leite, tomates, ketchup, mostrada, caldo de carne"), 
("Pão Caseiro 1", 60, "ovo, açúcar, sal, agua, óleo, fermento seco, farinha trigo"),
("Pão Caseiro 2", 60, "ovo, leite, fermento biologico, margarina, sal, açúcar, farinha de trigo"), 
("Lasanha", 50, "massa de lasanha, carne moída, presunto, mussarela, cebola, óleo, molho de tomate, queijo ralado"), 
("Filé ao molho madeira", 30, "filé mignon, champignon, manteiga, cebola, caldo de carne, vinho tinto seco, amido de milho"), 
("Filé de peixe com alcaparras", 20, "filé de peixe, Sal, Pimenta do reino, limão, azeite, alcaparra");

SELECT * FROM receitas;

ALTER TABLE receitas ADD FULLTEXT (ingredientes);

SELECT Prato
FROM receitas
WHERE Ingredientes NOT IN (SELECT Ingredientes 
							FROM receitas
							WHERE MATCH(Ingredientes) 
							AGAINST('leite, queijo, requeijão, iogurte'));

SELECT Ingredientes 
FROM receitas
WHERE MATCH(Ingredientes) 
AGAINST('leite, queijo, requeijão, iogurte');

SELECT COUNT(*) FROM receitas
WHERE MATCH(Ingredientes) 
AGAINST('leite, queijo, requeijão, iogurte');


CREATE DATABASE car;
USE car;

CREATE TABLE Fabricante (
	codigo INT(3) PRIMARY KEY AUTO_INCREMENT,
    marca CHAR(20) NOT NULL
);

CREATE TABLE Veiculo (
	RENAVAM INT(8) PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cor VARCHAR(20) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    fabricante_Codigo INT(3) NOT NULL,
    FOREIGN KEY (fabricante_Codigo)
		REFERENCES Fabricante(codigo)
);

INSERT INTO fabricante VALUES
(0, "Volk"),
(0, "Fait"),
(0, "Cherv"),
(0, "For"),
(0, "Maud"),
(0, "Jundaiy");


INSERT INTO veiculo VALUES
(1111111, "Volk 1", "prata", "30000", 1),
(2222222, "Volk 2", "preto", "50000", 1),
(3333333, "Fait 10", "vermelho", "32500", 2),
(4444444, "Fait 20", "verde", "45000", 2),
(6666666, "Cherv 11", "amarelo", "35000", 3),
(7777777, "For 22", "chumbo", "48000", 4),
(1234567, "Maud 100", "rosa", "90000", 5),
(8768769, "Junday 1", "grafite", "40000", 6),
(3434345, "Junday 0", "branco", "59000", 6);

SELECT * FROM veiculo;

CREATE VIEW v_menos50000 AS
SELECT 
	veiculo.nome AS Veiculo,
    fabricante.marca AS Marca,
    veiculo.cor AS Cor,
    veiculo.preco AS Valor
FROM
	veiculo INNER JOIN fabricante
WHERE veiculo.fabricante_Codigo = fabricante.Codigo
		AND veiculo.preco <= 50000;
        
SHOW TABLES;

SELECT * FROM v_menos50000;

DROP VIEW v_menos50000;


