USE db_biblioteca;

-- Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor com base na data de nascimento.

DELIMITER $$
CREATE FUNCTION idadeAutor(
	p_id_autor INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE idade_autor INT;
	SELECT TIMESTAMPDIFF(YEAR, (SELECT data_nascimento FROM td_autores WHERE id_autor = p_id_autor), CURDATE() ) INTO idade_autor;
    RETURN idade_autor;
END$$
DELIMITER ;

SELECT idadeAutor(1);

-- Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de livros escritos por esse autor.

DELIMITER $$
CREATE FUNCTION qntlivros(
	p_id_autor INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE qnt_livros INT;
	SELECT COUNT(id_livro) INTO qnt_livros FROM td_livros GROUP BY id_autor HAVING id_autor = p_id_autor;
    RETURN qnt_livros;
END$$
DELIMITER ;

SELECT qntlivros(3);

-- Exercicio 3. Crie uma função que recebe duas datas e retorna o total de empréstimos realizados nesse período.

DELIMITER $$
CREATE FUNCTION filtroEmprestimo(
	p_data_inicio DATE,
    p_data_final DATE
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE qnt_emprestimos INT;
	
    SELECT COUNT(*) INTO qnt_emprestimos
	FROM td_emprestimos 
	WHERE data_emprestimo BETWEEN p_data_inicio AND p_data_final
	AND data_devolucao BETWEEN p_data_inicio AND p_data_final;
    
    RETURN qnt_emprestimos;
END$$
DELIMITER ;

SELECT * FROM td_emprestimos;

SELECT filtroEmprestimo('2000-01-01', '2026-01-01')

-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros foram emprestados.

DELIMITER $$
CREATE FUNCTION mediaDias()
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE media_emprestimos INT;
    SELECT AVG( TIMESTAMPDIFF(DAY, data_emprestimo, data_devolucao)) INTO media_emprestimos  FROM td_emprestimos;
    RETURN media_emprestimos;
END$$
DELIMITER ;

SELECT mediaDias()		;


