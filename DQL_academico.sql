USE db_academica;

-- DQL (CONSULTA DE DADOS):

-- Exercício 1: Liste todos os estudantes cadastrados na tabela estudantes que pertencem ao curso de Ciência de Dados e foram matriculados em 2024.
SELECT * FROM tb_estudantes 
WHERE YEAR(data_matricula) = 2022 AND id_curso = 5;
 
-- Exercício 2: Liste todos os professores que pertencem ao departamento de Ciência da Computação e possuem mais de 5 anos de experiência.
SELECT * FROM tb_professores WHERE ano_admissao <= CURDATE() - INTERVAL 5  YEAR;

-- Exercício 3: Liste os nomes dos estudantes e suas notas nas disciplinas, ordenados pela nota em ordem decrescente e, em caso de empate, pelo nome do estudante em ordem alfabética.
SELECT E.nome, D.nome, nota 
FROM tb_estudantes AS E
INNER JOIN tb_matriculas AS M
ON M.id_estudante = E.id_estudante
INNER JOIN tb_notas AS N
ON N.id_matricula = M.id_matricula
INNER JOIN tb_diciplinas AS D
ON D.id_diciplina = M.id_diciplina
ORDER BY nota DESC, E.nome ASC
;

-- Exercício 4: Encontre a média das notas dos estudantes no curso de Engenharia de Software.
SELECT AVG(nota)
FROM tb_estudantes AS E
INNER JOIN tb_matriculas AS M
ON M.id_estudante = E.id_estudante
INNER JOIN tb_notas AS N
ON N.id_matricula = M.id_matricula
INNER JOIN tb_cursos AS C
ON C.id_curso = E.id_curso
WHERE LOWER(C.nome) = 'medicina';

-- Exercício 5: Liste os cursos que possuem mais de 5 estudantes matriculados. Exiba o nome do curso e o total de estudantes matriculados.
SELECT E.nome, COUNT(*) AS qnt_cursos 
FROM tb_estudantes AS E
INNER JOIN tb_cursos AS C
ON E.id_curso = C.id_curso
GROUP BY id_estudante HAVING COUNT(*) >= 5;

-- SUBQUERY (CONSULTAS AVANÇADAS):

--  Exercício 1: Liste os cursos que possuem mais de 5 disciplinas associadas.
SELECT * FROM tb_cursos WHERE id_curso IN (SELECT id_curso FROM tb_diciplinas GROUP BY id_curso HAVING COUNT(*) >= 5);

-- Exercício 2: Liste os estudantes que estão matriculados em mais disciplinas do que a média de disciplinas por estudante.
SELECT E.nome, COUNT(id_diciplina) AS qnt_diciplinas 
FROM tb_matriculas AS M
INNER JOIN tb_estudantes AS E
ON M.id_estudante = E.id_estudante
GROUP BY M.id_estudante
HAVING qnt_diciplinas >= 
(SELECT AVG(qnt_diciplinas) AS media_aluno_por_diciplina FROM (SELECT COUNT(id_diciplina) AS qnt_diciplinas FROM tb_matriculas GROUP BY id_estudante) AS sub);

-- Exercício 3: Encontre os professores que ministram disciplinas com a maior média de notas.
SELECT P.nome
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
SELECT * FROM tb_professores WHERE id_professor  IN (
	SELECT DISTINCT P.id_professor
	FROM tb_notas AS N 
	INNER JOIN tb_matriculas AS M
	ON N.id_matricula = M.id_matricula
	INNER JOIN tb_diciplinas AS D
	ON D.id_diciplina = M.id_diciplina
	INNER JOIN tb_professores AS P
	ON P.id_professor = D.id_professor
	WHERE nota >= 7
);

SELECT  *
FROM tb_notas AS N 
INNER JOIN tb_matriculas AS M
ON N.id_matricula = M.id_matricula
INNER JOIN tb_diciplinas AS D
ON D.id_diciplina = M.id_diciplina
INNER JOIN tb_professores AS P
ON P.id_professor = D.id_professor

;





SELECT * FROM tb_notas;
SELECT * FROM tb_matriculas;
SELECT * FROM tb_estudantes;
SELECT * FROM tb_cursos;
SELECT * FROM tb_diciplinas;
SELECT * FROM tb_professores;


