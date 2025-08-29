USE db_academica;
-- FUNCTION

-- Exercício 1: Crie uma função chamada idade_estudante que receba a data de nascimento de um estudante e retorne à idade.
DELIMITER $$
CREATE FUNCTION idade_estudante(
	p_id_estudante INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE idade_estudante INT;
	SELECT TIMESTAMPDIFF(YEAR, (SELECT data_nascimento FROM tb_estudantes WHERE id_estudante = p_id_estudante), CURDATE() ) INTO idade_estudante;
    RETURN idade_estudante;
END$$
DELIMITER ;

SELECT idade_estudante('2');

-- Exercício 2: Crie uma função chamada total_estudantes_disciplina que receba o ID de uma disciplina e retorne o número de estudantes matriculados nela.
DELIMITER $$
CREATE FUNCTION total_estudantes_disciplina(
	p_id_diciplina INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total_estudantes_disciplina INT;
    
	SELECT COUNT(id_estudante) INTO total_estudantes_disciplina FROM tb_matriculas
	GROUP BY id_diciplina
	HAVING id_diciplina = p_id_diciplina;
    
    RETURN total_estudantes_disciplina;
END$$
DELIMITER ;

SELECT total_estudantes_disciplina('1');

-- Exercício 3: Crie uma função chamada nota_maxima que retorne a maior nota registrada na tabela notas.
DELIMITER $$
CREATE FUNCTION nota_maxima()
RETURNS DECIMAL(4,2)
READS SQL DATA
BEGIN
	DECLARE nota_maxima DECIMAL(4,2);
	SELECT MAX(nota) INTO nota_maxima FROM tb_notas;
    RETURN nota_maxima;
END$$
DELIMITER ;

SELECT nota_maxima();

-- Exercício 4: Crie uma função chamada disciplina_do_curso que receba o ID de um curso e retorne o nome da disciplina associada.
DELIMITER $$
CREATE FUNCTION disciplina_do_curso(
	p_id_curso INT
)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	DECLARE disciplina_do_curso VARCHAR(100);
	SELECT GROUP_CONCAT(nome SEPARATOR ', ' ) INTO disciplina_do_curso FROM tb_diciplinas WHERE id_curso = p_id_curso;
    RETURN disciplina_do_curso;
END$$
DELIMITER ;

SELECT disciplina_do_curso('4');

-- Exercício 5: Crie uma função chamada media_notas_curso que receba o ID de um curso e retorne a média das notas dos estudantes matriculados nesse curso.
DELIMITER $$
CREATE FUNCTION media_notas_curso(
	p_id_curso INT
)
RETURNS DECIMAL(4,2)
READS SQL DATA
BEGIN
	DECLARE media_notas_curso DECIMAL(4,2);
    
	SELECT AVG(nota) INTO media_notas_curso
	FROM tb_matriculas AS M
	INNER JOIN tb_notas AS N 
	ON N.id_matricula = M.id_matricula
	INNER JOIN tb_diciplinas AS D
	ON D.id_diciplina = M.id_diciplina
	WHERE id_curso = p_id_curso;
    
    RETURN media_notas_curso;
END$$
DELIMITER ;

SELECT  media_notas_curso('4');







