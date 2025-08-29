-- BIBLIOTECA
USE db_biblioteca;

-- EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.


DELIMITER $$ 
CREATE PROCEDURE inserirAutor (
	IN p_id_autor INT,
    IN p_nome VARCHAR(100),
	IN p_data_nascimento DATE
)
BEGIN
	INSERT INTO td_autores (id_autor, nome, data_nascimento) 
    VALUES (p_id_autor, p_nome, p_data_nascimento);
END $$

DELIMITER ;

CALL inserirAutor ('7', 'teste_procedure', '2020-01-01');

SELECT * FROM td_autores;

-- EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.

DELIMITER $$ 
CREATE PROCEDURE atualizarDevolucao (
	IN p_id_emprestimo INT,
    IN p_data_devolucao DATE
)
BEGIN
	UPDATE td_emprestimos SET data_devolucao = p_data_devolucao WHERE id_emprestimo = p_id_emprestimo;
END $$

DELIMITER ;

CALL atualizarDevolucao ('1', '2020-01-01');

SELECT * FROM td_emprestimos;



-- EXERCICIO 3. Crie uma stored procedure que consulte todos os livros emprestados por um determinado membro, retornando os títulos dos livros e as datas de empréstimo.

DELIMITER $$ 
CREATE PROCEDURE consultarEmprestimo (
	IN p_id_membro INT
)
BEGIN
	SELECT titulo, data_emprestimo
    FROM td_emprestimos AS E
    INNER JOIN td_livros AS L
    ON E.id_livro = L.id_livro
    WHERE id_membro = p_id_membro;
END $$

DELIMITER ;

CALL consultarEmprestimo ('1');





