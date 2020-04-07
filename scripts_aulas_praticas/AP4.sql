INSERT 
	INTO livros (titulo, autor, categoria, editora)
    VALUES ('Prog. em banco de dados', 'Kroton', 'Educacional', 'Londrina SA');

SELECT * FROM livros;

INSERT 
	INTO livros (titulo, autor, categoria, editora)
    VALUES ('Algoritmos', 'Kroton', 'Educacional', 'Londrina SA');
INSERT 
	INTO livros (titulo, autor, categoria)
    VALUES ('Calculo', 'Kroton', 'Educacional'); 
    
INSERT 
	INTO livros (editora)
    VALUES ('Londrina SA');
    
UPDATE livros
SET editora = 'Londrina SA'
WHERE id = 3;

UPDATE livros
SET titulo = 'Estrutura de Dados', autor='Kroton', categoria='Educacional'
WHERE id = 4;

INSERT INTO autor (nome, pais)
VALUES ('Joao','Brasil');

SELECT * FROM autor;