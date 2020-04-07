CREATE DATABASE siteCurso
	DEFAULT CHARSET latin1
    DEFAULT COLLATE latin1_general_ci;
    
USE siteCurso;

CREATE TABLE tbl_Aluno (
    COD INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    ESTADO VARCHAR(2),
    CIDADE VARCHAR(30),
    TELEFONE BIGINT(9)
);

INSERT INTO tbl_Aluno VALUES
(0,"João", "SP", "Campinas", 997989495),
(0,"Ana", "SP", "São Paulo", 997989495),
(0, "Marcia", "RJ", "Rio de Janeiro", 997989495),
(0,"Carlos", "SP", "Campinas", 997989495),
(0,"Mario", "SP", "Piracicaba", 997989495),
(0,"Patricia", "MG", "Belo Horizonte", 997989495),
(0,"Paulo", "SP", "Valinos", 997989495);

SELECT * FROM tbl_Aluno;

CREATE TABLE tbl_Curso (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    VALOR DECIMAL(8 , 2 ),
    CARGA_HORARIA INT
);

INSERT tbl_Curso VALUES
(0, "Oracle PL/SQL", 500, 25),
(0, "MySQL", 499, 25),
(0, "Java Fundamentos", 800, 40),
(0, "Cisco CCNA", 1000, 40);

SELECT * FROM tbl_curso;

CREATE TABLE tbl_Contrato (
    NUMERO INT PRIMARY KEY,
    DATA DATE,
    tbl_Aluno_COD INT NOT NULL,
    tbl_Curso_ID INT NOT NULL,
    FOREIGN KEY (tbl_Aluno_COD)
        REFERENCES tbl_Aluno (COD),
    FOREIGN KEY (tbl_Curso_ID)
        REFERENCES tbl_Curso (ID)
);

INSERT tbl_Contrato VALUES
(1, CURRENT_DATE   , 1, 4),
(2, CURRENT_DATE +2, 2, 3),
(3, CURRENT_DATE +3, 3, 2),
(4, CURRENT_DATE +1, 4, 1),
(5, CURRENT_DATE -2, 5, 4),
(6, CURRENT_DATE -4, 6, 3),
(7, CURRENT_DATE -3, 6, 2),
(8, CURRENT_DATE -1, 1, 1),
(9, CURRENT_DATE   , 2, 2),
(10, CURRENT_DATE +1, 5, 3);

SELECT * FROM tbl_contrato;

SELECT 
tbl_Contrato.NUMERO AS 'CONTRATO',
tbl_Aluno.NOME AS 'ALUNO',
tbl_Curso.NOME AS 'CURSO',
tbl_Curso.VALOR AS 'VALOR'
FROM
tbl_Contrato 
INNER JOIN 
tbl_Aluno
ON tbl_Contrato.tbl_Aluno_COD = tbl_Aluno.COD
INNER JOIN
tbl_Curso ON tbl_Contrato.tbl_Curso_ID = tbl_Curso.ID
ORDER BY tbl_Contrato.NUMERO;

SELECT tbl_Aluno.NOME AS 'NOME',
tbl_Contrato.NUMERO AS 'CONTRATO'
FROM
tbl_Contrato
RIGHT JOIN
tbl_Aluno ON tbl_Contrato.tbl_Aluno_COD = tbl_Aluno.COD
LEFT JOIN 
tbl_Curso ON tbl_Contrato.tbl_Curso_ID = tbl_Curso.ID;

SELECT DISTINCT
tbl_Aluno.NOME AS 'ALUNO', 
tbl_Aluno.TELEFONE AS 'CONTATO'
FROM
tbl_Contrato INNER JOIN tbl_Aluno
ON tbl_Contrato.tbl_Aluno_COD = tbl_Aluno.COD
WHERE
DATA < CURRENT_DATE;






 



