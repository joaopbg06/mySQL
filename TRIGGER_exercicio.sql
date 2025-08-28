USE clinicavetbd;
/* 
Exercício 1. Crie um trigger que, sempre que um novo pet for inserido na tabela,
calcule automaticamente a idade do pet com base em sua data de nascimento e
armazene esse valor na coluna idade.
*/

SELECT * FROM tb_pets;

ALTER TABLE tb_pets ADD idade INT(3);

/*
SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE()); 
*/

INSERT INTO tb_pets VALUES (
	'5',
    'Bananine',
    'macaco',
    'chimpazé',
    '2000-01-01',
    '2',
    NULL
);

-- Biblioteca

USE db_biblioteca;

-- Exercicio 1. Criar uma trigger que impeça a inserção de autores com menos de 18 anos.

/*
	IF TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE()) < 18 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possivel inserir um autor menor de 18 anos';
    END IF;
*/


SELECT * FROM td_autores;

INSERT INTO td_autores VALUES (
	'7',
    'teste_17anos',
    '2008-06-06'
);

-- Error Code: 1644. Não é possivel inserir um autor menor de 18 anos

-- Exercicio 2. Criar uma trigger que atualize automaticamente a data de devolução para 15 dias após a data de empréstimo.

SELECT * FROM td_emprestimos;

-- SET NEW.data_devolucao = DATE_ADD(NEW.data_emprestimo, INTERVAL 15 DAY);

INSERT INTO td_emprestimos VALUES (
	'6',
    '1',
    '1',
    '2000-01-01',
    NULL
);

-- Exercicio 3. Criar uma trigger que impeça que um membro faça mais de 3 empréstimos ao mesmo tempo.

SELECT * FROM td_emprestimos;

/*
DECLARE total_emprestimo INT;

SELECT COUNT(*) INTO total_emprestimo FROM td_emprestimos
WHERE id_membro = NEW.id_membro AND data_devolucao IS NULL;
    
IF total_emprestimo >= 3 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'O límite é 3 livros';
END IF;
    */
INSERT INTO td_emprestimos VALUES (
	'10',
    '1',
    '2',
    '2000-01-01',
    NULL
);

-- Error Code: 1644. O límite é 3 livros

-- Exercicio 4. Trigger de Atualização Automática da Data de Adesão

SELECT * FROM td_membros;

INSERT INTO td_membros VALUES (
	'6',
    'teste_data_adesao',
    NULL
);

-- Exercicio 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.

SELECT * FROM td_autores;

/*
IF LOWER(NEW.nome) IN (SELECT LOWER(nome) FROM td_autores) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Já existe um autor com esse nome';
END IF;
*/

INSERT INTO td_autores VALUES (
	'7',
    'KARL MArx',
    '2020-12-01'
);

-- Error Code: 1644. Já existe um autor com esse nome





