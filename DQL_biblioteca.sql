USE db_biblioteca;
SELECT * FROM  td_emprestimos;

SELECT MIN(ano_publicacao) AS 'livro mais antigo' FROM td_livros;
SELECT * FROM td_livros ORDER BY ano_publicacao ASC LIMIT 1;

SELECT MAX(ano_publicacao) AS 'livro mais recente' FROM td_livros;
SELECT *  FROM td_livros ORDER BY ano_publicacao DESC LIMIT 1 ;

SELECT COUNT(id_livro) AS 'Quantidade de livro cadastrado' FROM td_livros;

SELECT * FROM td_emprestimos WHERE data_devolucao = '2001-09-12';

SELECT * FROM td_autores ORDER BY nome ASC;

SELECT * FROM td_livros ORDER BY titulo DESC;


