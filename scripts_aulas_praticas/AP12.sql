CREATE DATABASE calculo;
USE calculo;

CREATE TABLE tabuada(
	a INT
);

INSERT tabuada 
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

CREATE FUNCTION fn_tabuada (x INT, y INT)
	RETURNS INT
	RETURN (x * y);
    
SHOW FUNCTION STATUS;

SHOW CREATE FUNCTION fn_tabuada;

SELECT fn_tabuada(a, 4) AS "Resultado"
FROM tabuada;

DROP FUNCTION fn_tabuada;

-- PROCEDIMENTO 2 -----------------------------------------

CREATE DATABASE radio;
USE radio;

-- Desenvolver a tabela para armazenar os dados disponíveis no setlist:

CREATE TABLE setlist (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    NomeDaMusica VARCHAR(30) NOT NULL,
    Horario TIME NOT NULL,
    Idioma VARCHAR(30) NOT NULL
);

-- Inserir os dados do setlist;
INSERT setlist VALUES
(0, "Vinheta", "07:58:00", "Portugues"),
(0, "AAA_Musica", "08:00:00", "Portugues"),
(0, "BBB_Song", "08:05:00", "Ingles"),
(0, "CCC_Song", "08:10:00", "Ingles"),
(0, "Propaganda", "08:15:00", "Portugues"),
(0, "MMM_Musica", "08:18:00", "Portugues"),
(0, "WWW_Song", "08:25:00", "Ingles"),
(0, "TTT_Song", "08:30:00", "Ingles"),
(0, "Propaganda", "08:37:00", "Portugues"),
(0, "PPP_Musica", "08:38:00", "Portugues"),
(0, "OOO_Musica", "08:44:00", "Portugues"),
(0, "LLL_Song", "08:47:00", "Ingles"),
(0, "VVV_Song", "08:51:00", "Ingles"),
(0, "YYY_Song", "08:55:00", "Ingles"),
(0, "UUU_Musica", "08:58:00", "Portugues"),
(0, "QQQ_Song", "09:12:00", "Ingles"),
(0, "Propaganda", "09:17:00", "Portugues"),
(0, "ZZZ_Song", "09:23:00", "Ingles"),
(0, "UUU_Musica", "09:27:00", "Portugues");

-- Desenvolver um procedimento armazenado que dado o idioma, 
-- devem ser retornadas todas as músicas e o horário que tocou na web rádio 
-- (com exceção da vinheta e das propagandas):

CREATE PROCEDURE proc_Idioma (var_Idioma VARCHAR(30))
SELECT NomeDaMusica, Horario
FROM setlist
WHERE Idioma = var_Idioma AND NomeDaMusica<> "Vinheta" AND NomeDaMusica<> "Propaganda";

-- Fazer o teste com os dois idiomas: português e inglês. 
-- E verificar se a lista não retornou a vinheta e as propagandas:

CALL proc_Idioma("Portugues");
CALL proc_Idioma("Ingles");
