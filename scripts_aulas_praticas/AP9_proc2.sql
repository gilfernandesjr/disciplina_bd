CREATE DATABASE biblio;

USE biblio;

CREATE TABLE aluno (
    RA INT PRIMARY KEY,
    nome VARCHAR(50),
    telefone CHAR(11)
);

CREATE TABLE funcionario (
    matricula INT PRIMARY KEY,
    nome VARCHAR(50),
    cargo VARCHAR(50)
);

CREATE TABLE livro (
    isbn INT PRIMARY KEY,
    nome VARCHAR(50),
    secao VARCHAR(50)
);

CREATE TABLE emprestimo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    retirada DATE,
    devolucao DATE,
    aluno_RA INT,
    funcionario_mat INT,
    livro_isbn INT,
    FOREIGN KEY (aluno_RA)
        REFERENCES aluno (RA),
    FOREIGN KEY (funcionario_mat)
        REFERENCES funcionario (matricula),
    FOREIGN KEY (livro_isbn)
        REFERENCES livro (isbn)
);

ALTER TABLE emprestimo
ADD CONSTRAINT FK_emprestimoAluno 
FOREIGN KEY (aluno_RA) references aluno(RA);
 
 
CREATE TABLE restricao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_RA INT,
    livro_isbn INT,
    FOREIGN KEY (aluno_RA)
        REFERENCES aluno (RA),
    FOREIGN KEY (livro_isbn)
        REFERENCES livro (isbn)
);

SHOW TABLES FROM biblio;
DESCRIBE emprestimo;

insert into restricao values (0,12345, 22222);

 INSERT into aluno VALUES
 (11223, "Maria", "11999988999"),
 (12345, "Joao", "11999997899"),
 (54321, "Jose", "11999995699"),
 (56789, "Jonas", "11999997699"),
 (98765, "Bia", "11999999888");
 
 INSERT INTO funcionario VALUES
 (1,"func1", "bibliotecario 1"),
  (2,"func2", "bibliotecario 2");
  
  insert into livro values
  (11111, "livro 1", "musica"),
    (22222, "livro 2", "musica"),
      (33333, "livro 3", "terror"),
        (44444, "livro 4", "musica"),
          (55555, "livro 5", "terror"),
            (66666, "livro 6", "terror"),
              (77777, "livro 7", "musica"),
                (88888, "livro 8", "musica"),
                  (99999, "livro 9", "esoterismo");
          

Insert into emprestimo values
(0,20180115,20180201,11223,1,11111),
(0,20180405,20180420,56789,1,11111),
(0,20180315,20180330,98765,1,11111),
(0,20180606,20180621,56789,1,11111),
(0,20180801,20180816,12345,1,11111),
(0,20181010,20181025,11223,1,11111);

SELECT 
    aluno.nome
FROM
    aluno
WHERE
    aluno.RA IN (SELECT 
            aluno_RA
        FROM
            restricao);
            
SELECT aluno.nome, restricao.aluno_RA
FROM aluno
INNER JOIN restricao ON restricao.aluno_RA = aluno.RA;

SELECT 
    aluno.nome
FROM
    aluno;

SELECT 
    *
FROM
    restricao;
SELECT 
    *
FROM
    aluno;




SELECT 
    aluno.nome AS 'ALUNO'
FROM
    aluno
WHERE
    aluno.RA NOT IN (SELECT 
            aluno_RA
        FROM
            emprestimo);
  
  


