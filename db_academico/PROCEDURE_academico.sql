USE db_academica;
-- PROCEDURE

-- Exercício 1: Crie uma procedure chamada insere_professor que insere um professor na tabela professores e retorna o ID gerado.
DELIMITER $$
CREATE PROCEDURE insere_professor(
	IN p_nome VARCHAR(100),
    IN p_departamento VARCHAR(100),
    IN p_ano_admissao DATE
)
BEGIN

	INSERT INTO tb_professores (nome, departamento, ano_admissao) 
    VALUES (p_nome, p_departamento, p_ano_admissao);
    
    SELECT id_professor FROM tb_professores ORDER BY id_professor DESC LIMIT 1;
END $$
DELIMITER ;

CALL insere_professor('Adriano', 'Comercial', CURDATE());

-- Exercício 2: Crie uma procedure chamada atualiza_disciplina que recebe o ID de uma disciplina e atualiza o nome dessa disciplina.
DELIMITER $$
CREATE PROCEDURE atualiza_disciplina(
	IN p_id_diciplina INT,
	IN p_nome VARCHAR(100)
)
BEGIN
	UPDATE tb_diciplinas SET nome = p_nome WHERE id_diciplina = p_id_diciplina;
END $$
DELIMITER ;

CALL atualiza_disciplina('6', 'Genética');

-- Exercício 3: Crie uma procedure chamada remove_estudante que remove um estudante da tabela estudantes com base no ID passado como parâmetro.
DELIMITER $$
CREATE PROCEDURE remove_estudante(
	IN p_id_estudante INT
)
BEGIN
	DELETE FROM tb_estudantes  WHERE id_estudante = p_id_estudante;
END $$
DELIMITER ;

CALL remove_estudante('6');

-- Exercício 4: Crie uma procedure chamada consulta_professor que retorna o nome e departamento de um professor com base no ID passado.
DELIMITER $$
CREATE PROCEDURE consulta_professor(
	IN p_id_professor INT
)
BEGIN
	SELECT nome, departamento FROM tb_professores WHERE id_professor = p_id_professor;
END $$
DELIMITER ;

CALL consulta_professor('2');

-- Exercício 5: Crie uma procedure chamada atualiza_nota que atualiza a nota de um estudante para uma disciplina específica, com base no ID da matrícula.
DELIMITER $$
CREATE PROCEDURE atualiza_nota(
	IN p_id_matricula INT,
    IN p_nota DECIMAL (4,2)
)
BEGIN
	UPDATE tb_notas SET nota = p_nota WHERE id_matricula = p_id_matricula;
END $$
DELIMITER ;

CALL atualiza_nota('3', '9.5');

SELECT * FROM tb_notas;
SELECT * FROM tb_matriculas;
SELECT * FROM tb_estudantes;
SELECT * FROM tb_cursos;
SELECT * FROM tb_diciplinas;
SELECT * FROM tb_professores;