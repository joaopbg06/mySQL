USE db_academica;

-- TRIGGER

-- Exercício 1: Crie um trigger chamado verifica_nota_maxima que impede a inserção de uma nota superior a 10.
/*
IF NEW.nota > 10 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possivel inserir uma nota maior que 10';
	END IF;
*/
INSERT INTO tb_notas (id_matricula, nota, data_lancamento) VALUES 
(6, 11, '2022-11-28');
-- Error Code: 1644. Não é possivel inserir uma nota maior que 10

-- Exercício 2: Crie um trigger chamado atualiza_data_matricula que atualiza a data de matrícula para a data atual sempre que uma nova matrícula for inserida.
/*
SET NEW.data_matricula = CURDATE();
*/
INSERT INTO tb_matriculas (id_estudante, id_diciplina, data_matricula) VALUES 
(3, 2, NULL);
-- '7', '3', '2', '2025-08-29'


-- Exercício 3: Crie um trigger chamado impede_deletar_disciplina que impeça a exclusão de disciplinas que ainda possuem estudantes matriculados.
/*
	IF OLD.id_diciplina IN (SELECT DISTINCT id_diciplina FROM tb_matriculas) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possivel excluir uma disciplina onde existe matriculas de estudantes';
    END IF;
*/
DELETE FROM tb_diciplinas WHERE id_diciplina = 5
;
-- Error Code: 1644. Não é possivel excluir uma disciplina onde existe matriculas de estudantes
