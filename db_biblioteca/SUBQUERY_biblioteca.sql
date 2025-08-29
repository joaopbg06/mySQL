USE db_biblioteca;

SELECT * FROM td_autores;
SELECT * FROM td_emprestimos;
SELECT * FROM td_livros;
SELECT * FROM td_membros;

-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos de publicação de todos os livros cadastrados.

SELECT * FROM td_livros AS L
INNER JOIN td_autores AS A
ON L.id_autor = A.id_autor
WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM td_livros);

-- b. Liste os livros que foram emprestados ao menos uma vez.

SELECT * FROM td_livros WHERE id_livro IN (SELECT DISTINCT id_livro FROM td_emprestimos);

-- c. Consulte os livros que ainda não foram emprestados.

SELECT * FROM td_livros WHERE id_livro NOT IN (SELECT DISTINCT id_livro FROM td_emprestimos);
















