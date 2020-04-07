create database Loja;
USE Loja;

CREATE TABLE Categoria (
    Id INT(3) PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Produto (
    Codigo INT(3) PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(6 , 2 ) NOT NULL,
    Id_Categoria INT(3) NOT NULL,
    FOREIGN KEY (Id_Categoria)
        REFERENCES Categoria (Id)
);

INSERT Categoria VALUES 
(0, "DVD"),
(0, "Livro"),
(0, "Informática");

DELETE FROM Categoria WHERE ID=4;

SELECT * FROM Categoria;

INSERT Produto VALUES 
(0, "Código da Vinci", "39.99", 2),
(0, "Hancock", "89.99", 1),
(0, "Dario de um Mago", "19.99", 2),
(0, "Eu sou a lenda", "39.99", 1);

SELECT nome, preco FROM Produto;

SELECT 
    categoria.nome, produto.nome
FROM
    Categoria
        INNER JOIN
    Produto ON Categoria.Id = Produto.Id_Categoria;


SELECT 
    categoria.nome AS 'Tipo',
    produto.nome AS 'Produto',
    produto.valor
FROM
    Categoria
        INNER JOIN
    Produto ON Categoria.Id = Produto.Id_Categoria
WHERE
    produto.valor < 50.00;
    
    
SELECT 
    categoria.nome AS 'Tipo',
    produto.nome AS 'Produto',
    produto.valor
FROM
    Categoria
        LEFT JOIN
    Produto ON Categoria.Id = Produto.Id_Categoria;

SELECT 
    categoria.nome AS 'Tipo',
    produto.nome AS 'Produto',
    produto.valor
FROM
    Categoria
        RIGHT JOIN
    Produto ON Categoria.Id = Produto.Id_Categoria;