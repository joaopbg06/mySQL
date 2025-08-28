USE db_biblioteca;

SELECT * FROM td_autores;
SELECT * FROM td_emprestimos;
SELECT * FROM td_livros;
SELECT * FROM td_membros;

-- INNER JOIN

-- 1. Liste o título do livro e o nome do autor.
SELECT titulo, nome FROM td_livros AS L
INNER JOIN td_autores AS A
ON L.id_autor = A.id_autor;

-- 2. Liste o título do livro, o nome do autor e o ano de publicação.
SELECT titulo, nome, ano_publicacao FROM td_livros AS L
INNER JOIN td_autores AS A
ON L.id_autor = A.id_autor;

-- 3. Liste o nome do membro, o título do livro e a data de empréstimo.

SELECT nome, titulo, data_emprestimo 
FROM td_emprestimos AS E
INNER JOIN td_livros AS L
ON E.id_livro = L.id_livro
INNER JOIN td_membros AS M
ON E.id_membro = M.id_membro;

-- 4. Liste todos os empréstimos com o nome do membro, título do livro, nome do autor e data de devolução.
SELECT M.nome, titulo, A.nome, data_devolucao 
FROM td_emprestimos AS E
INNER JOIN td_livros AS L
ON E.id_livro = L.id_livro
INNER JOIN td_membros AS M
ON E.id_membro = M.id_membro
INNER JOIN  td_autores AS A
ON L.id_autor = A.id_autor;

-- LEFT JOIN

-- 5. Liste todos os membros e, caso existam, os livros que eles já emprestaram.

SELECT nome, titulo
FROM td_membros AS M
LEFT JOIN td_emprestimos AS E
ON M.id_membro = E.id_membro
LEFT JOIN td_livros AS L
ON E.id_livro = L.id_livro;

-- 6. Liste todos os autores e os livros que eles escreveram (mesmo que algum autor ainda não tenha livros cadastrados).

SELECT *
FROM td_autores AS A
LEFT JOIN td_livros AS L
ON A.id_autor = L.id_autor;

-- RIGHT JOIN

-- 7. Liste todos os livros e, caso tenham, o nome do autor correspondente.

SELECT *
FROM td_autores AS A
RIGHT JOIN td_livros AS L
ON L.id_autor = A.id_autor;

-- 8. Liste todos os livros e, caso tenham, os membros que os emprestaram.

SELECT titulo, nome
FROM td_emprestimos AS E
RIGHT JOIN td_livros AS L
ON L.id_livro = E.id_livro
left JOIN td_membros AS M
ON M.id_membro = E.id_membro;




