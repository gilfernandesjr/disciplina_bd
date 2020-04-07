CREATE DATABASE IF NOT EXISTS papelaria
	DEFAULT CHARSET = latin1
    DEFAULT COLLATE = latin1_general_ci;

CREATE TABLE cliente (
	idCliente INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL DEFAULT'',
    cpf CHAR(11) NOT NULL DEFAULT''
);

CREATE TABLE IF NOT EXISTS produto (
	idProduto INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL DEFAULT'',
    qtdEstoque INT(10) NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS compra (
	idCompra INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_idCliente INT(10) NOT NULL,
    produto_idProduto INT(10) NOT NULL,
    precoTotal DECIMAL(5,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (cliente_idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto)
);

SHOW TABLES FROM papelaria;
SHOW COLUMNS FROM compra;

ALTER TABLE compra ADD CONSTRAINT fk_compra_cliente_idx
FOREIGN KEY (cliente_idCliente) REFERENCES cliente(idCliente);
ALTER TABLE compra ADD CONSTRAINT fk_compra_produto_idx
FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto);

INSERT INTO cliente (nome, cpf, endereco)
VALUES ('fulano','12345678900','rua A');
INSERT INTO cliente (nome, cpf, endereco)
VALUES ('ciclano','22233344455','rua B');
INSERT INTO cliente (nome, cpf, endereco)
VALUES ('beltrano','11111111199','rua C');
INSERT INTO cliente (nome, cpf, endereco)
VALUES ('joao','11111111188','rua C');

INSERT INTO produto (nome, tipo, qtdEstoque)
VALUES ('sulfite A4','papel','50');
INSERT INTO produto (nome, tipo, qtdEstoque)
VALUES ('lapiseira X','lapis','70');

SHOW COLUMNS FROM compra;
INSERT INTO compra (cliente_idCliente, produto_idProduto, qtd, precoTotal)
VALUES (2,1,10,50);
INSERT INTO compra (cliente_idCliente, produto_idProduto, qtd, precoTotal)
VALUES (1,2,2,20.99);

SELECT * FROM cliente;

ALTER TABLE compra DROP FOREIGN KEY fk_compra_cliente_idx;
ALTER TABLE compra DROP FOREIGN KEY fk_compra_produto_idx;
ALTER TABLE cliente DROP PRIMARY KEY;
ALTER TABLE cliente ADD CONSTRAINT PK_cliente
PRIMARY KEY (idCliente, cpf);

DROP TABLE compra;
ALTER TABLE cliente MODIFY idCliente INT(10) NOT NULL;

SELECT * FROM compra;

DROP TABLE IF EXISTS cliente;
ALTER TABLE cliente CHANGE idCliente idC INT(20);

TRUNCATE TABLE cliente;

SELECT * FROM compra;

DROP TABLE compra;
DELETE FROM cliente WHERE idCliente=1;
DELETE FROM compra WHERE idCompra=2;