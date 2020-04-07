CREATE DATABASE farmacia
	DEFAULT CHARSET = latin1
    DEFAULT COLLATE = latin1_general_ci;

CREATE TABLE IF NOT EXISTS produto (
	codProd INT(10),
    nome VARCHAR(50),
    categoria VARCHAR(50),
    preco DECIMAL(3,2)
);

CREATE TABLE IF NOT EXISTS cliente (
	codCliente INT(10) AUTO_INCREMENT,
    nome VARCHAR(50),
    endereco VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS compras (
	codCompra INT(10),
    c_cliente INT(10),
    c_produto INT(10),
    qtd INT(10),
    preco DECIMAL(3,2)
);

CREATE TABLE IF NOT EXISTS receitas (
	codReceita INT(10),
    c_cliente INT(10),
    c_produto INT(10),
    qtd INT(10)
);

SHOW TABLES FROM farmacia;
SHOW COLUMNS FROM cliente;

ALTER TABLE cliente 
ADD CONSTRAINT PK_cliente PRIMARY KEY (codCliente);

ALTER TABLE cliente
CHANGE codCliente codCliente INT(10) AUTO_INCREMENT;

ALTER TABLE cliente
MODIFY codCliente INT(10) AUTO_INCREMENT;

ALTER TABLE produto
ADD CONSTRAINT PK_produto PRIMARY KEY (codProd);
ALTER TABLE compras
ADD CONSTRAINT PK_compras PRIMARY KEY (codCompra);
ALTER TABLE receitas
ADD CONSTRAINT PK_receitas PRIMARY KEY (codReceita);

SHOW COLUMNS FROM compras;
ALTER TABLE produto MODIFY codProd INT(10) AUTO_INCREMENT;

ALTER TABLE compras ADD CONSTRAINT FK_produtoCompra
FOREIGN KEY (c_produto) REFERENCES produto(codProd);

ALTER TABLE compras ADD CONSTRAINT FK_produtoCliente
FOREIGN KEY (c_cliente) REFERENCES cliente(codCliente);

SHOW COLUMNS FROM produto;
INSERT INTO cliente (nome, endereco) 
VALUES ('joao','rua 1');
INSERT INTO cliente (nome, endereco) 
VALUES ('maria','rua 11');
INSERT INTO cliente (nome, endereco) 
VALUES ('josé','rua 12');

SELECT * FROM produto;

INSERT INTO produto (nome, categoria, preco) 
VALUES ('dipirona','analgésico',8.99);
INSERT INTO produto (nome, categoria, preco) 
VALUES ('paracetamol','antiinflamatório',12.99);
INSERT INTO produto (nome, categoria, preco)
VALUES ('dorflex','analgésico',5.99);


ALTER TABLE compras MODIFY preco DECIMAL(5,2);
ALTER TABLE produto MODIFY nome VARCHAR(50) UNIQUE;
DELETE FROM produto WHERE codProd = 4;
SHOW COLUMNS FROM compras;

INSERT INTO compras (codCompra, c_cliente, c_produto, qtd, preco)
VALUES (1,1,1,2,17.98);
INSERT INTO compras (codCompra, c_cliente, c_produto, qtd, preco)
VALUES (2,3,2,1,12.99);
INSERT INTO compras (codCompra, c_cliente, c_produto, qtd, preco)
VALUES (3,4,2,1,12.99);

SELECT*FROM compras;