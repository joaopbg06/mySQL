USE db_biblioteca;

-- TRIGGER 
/*
	DECLARE total_emprestimo INT;

	SELECT COUNT(*) INTO total_emprestimo FROM td_emprestimos
    WHERE id_membro = NEW.id_membro AND data_devolucao IS NULL;
    
    IF total_emprestimo >= 3 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'O límite é 3 livros';
    END IF;
*/

SELECT * FROM td_emprestimos;

INSERT INTO td_emprestimos VALUES(
	'9',
    '1',
    '4',
    '2020-01-01',
    NULL
);

-- Error Code: 1644. O límite é 3 livros

-- EXERCICIO
-- Não pode deixar fazer um INSERT se o nome do autor for repetido

SELECT * FROM td_autores;
INSERT INTO td_autores VALUES(
	'6',
    'eiichiro oda',
    '2000-01-01'
);

-- Error Code: 1644. Já existe um autor com esse nome

/*
IF LOWER(NEW.nome) IN (SELECT LOWER(nome) FROM td_autores) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Já existe um autor com esse nome';
END IF;
*/













