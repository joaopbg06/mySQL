USE db_academica;
-- SUBQUERY (CONSULTAS AVANÇADAS):

--  Exercício 1: Liste os cursos que possuem mais de 5 disciplinas associadas.
SELECT * FROM tb_cursos WHERE id_curso IN (SELECT id_curso FROM tb_diciplinas GROUP BY id_curso HAVING COUNT(*) >= 2);

-- Exercício 2: Liste os estudantes que estão matriculados em mais disciplinas do que a média de disciplinas por estudante.
SELECT E.id_estudante, E.nome, COUNT(id_diciplina) AS qnt_diciplinas 
FROM tb_matriculas AS M
INNER JOIN tb_estudantes AS E
ON M.id_estudante = E.id_estudante
GROUP BY M.id_estudante
HAVING qnt_diciplinas >= 
(SELECT AVG(qnt_diciplinas) AS media_aluno_por_diciplina FROM (SELECT COUNT(id_diciplina) AS qnt_diciplinas FROM tb_matriculas GROUP BY id_estudante) AS sub);

-- Exercício 3: Encontre os professores que ministram disciplinas com a maior média de notas.
SELECT P.nome, D.nome
FROM tb_notas AS N 
INNER JOIN tb_matriculas AS M
ON N.id_matricula = M.id_matricula
INNER JOIN tb_diciplinas AS D
ON D.id_diciplina = M.id_diciplina
INNER JOIN tb_professores AS P
ON P.id_professor = D.id_professor
WHERE M.id_diciplina = 
(SELECT id_diciplina
FROM tb_notas AS N 
INNER JOIN tb_matriculas AS M
ON N.id_matricula = M.id_matricula
GROUP BY id_diciplina ORDER BY AVG(nota) DESC LIMIT 1)
;

-- Exercício 4: Liste os estudantes que possuem pelo menos uma nota abaixo da média geral de notas.
SELECT * FROM tb_estudantes WHERE id_estudante IN (
	SELECT E.id_estudante
	FROM tb_notas AS N 
	INNER JOIN tb_matriculas AS M
	ON N.id_matricula = M.id_matricula
	INNER JOIN tb_estudantes AS E
	ON E.id_estudante = M.id_estudante
	WHERE nota < (SELECT AVG(nota) FROM tb_notas)
);

-- Exercício 5: Liste os professores que não possuem nenhuma disciplina com notas abaixo de 7.
SELECT * FROM tb_professores WHERE id_professor IN (
	SELECT D.id_professor
	FROM tb_matriculas AS M
	INNER JOIN tb_notas AS N 
	ON N.id_matricula = M.id_matricula
	INNER JOIN tb_diciplinas AS D
	ON D.id_diciplina = M.id_diciplina
	GROUP BY D.id_professor
	HAVING MIN(nota) >= 7
);
