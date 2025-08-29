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







