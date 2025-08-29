USE db_academica;

SELECT * FROM tb_cursos;
INSERT INTO tb_cursos (nome, duracao_anos) VALUES 
('Biotecnologia', 5),
('Engenharia Civil', 5),
('Psicologia', 5),
('Medicina', 6),
('Ciência de Dados', 4);

SELECT * FROM tb_professores;
INSERT INTO tb_professores (nome, departamento, ano_admissao) VALUES 
('Roberto Almeida', 'Biociências', '2018-03-12'),
('Willan Souza', 'Matemática', '2014-01-08'),
('Juliana Castro', 'Tecnologia da Informação', '2023-01-01'),
('Marcos Lima', 'Engenharia', '2020-08-20'),
('Thiago Mendes', 'Linguagens e Códigos', '2022-09-11');

SELECT * FROM tb_diciplinas;
INSERT INTO tb_diciplinas (nome, id_curso, id_professor) VALUES 
('Anatomia Humana', 4, 1),                -- Medicina + Roberto
('Cálculo Diferencial e Integral', 2, 2), -- Engenharia Civil + Willan
('Programação Python', 5, 3),             -- Ciência de Dados + Juliana
('Psicologia do Desenvolvimento', 3, 5),  -- Psicologia + Thiago
('Bioinformática', 1, 1);                 -- Biotecnologia + Roberto


SELECT * FROM tb_estudantes;
INSERT INTO tb_estudantes (nome, data_nascimento, email, id_curso, data_matricula) VALUES 
('Lucas Pereira', '2002-05-14', 'lucas.pereira@email.com', 1, '2021-02-10'),
('Ana Ribeiro', '2001-08-22', 'ana.ribeiro@email.com', 2, '2020-08-15'),
('Bruna Martins', '2003-01-10', 'bruna.martins@email.com', 5, '2022-03-05'),
('Carlos Silva', '2000-11-30', 'carlos.silva@email.com', 3, '2019-07-20'),
('Fernanda Costa', '2001-04-18', 'fernanda.costa@email.com', 4, '2020-01-10');

SELECT * FROM tb_matriculas;
INSERT INTO tb_matriculas (id_estudante, id_diciplina, data_matricula) VALUES 
(1, 5, '2021-02-10'),  -- Lucas → Bioinformática
(2, 2, '2020-08-15'),  -- Ana → Cálculo
(3, 3, '2022-03-05'),  -- Bruna → Programação Python
(4, 4, '2019-07-20'),  -- Carlos → Psicologia do Desenvolvimento
(5, 1, '2020-01-10');  -- Fernanda → Anatomia Humana

SELECT * FROM tb_notas;
INSERT INTO tb_notas (id_matricula, nota, data_lancamento) VALUES 
(1, 8.5, '2021-06-30'),
(2, 7.0, '2020-12-20'),
(3, 9.2, '2022-07-15'),
(4, 6.8, '2019-11-05'),
(5, 7.9, '2020-06-22');

-- INSERT adicionais para verificar consultas

INSERT INTO tb_notas (id_matricula, nota, data_lancamento) VALUES 
(6, 6.5, '2022-11-28')
;

INSERT INTO tb_matriculas (id_estudante, id_diciplina, data_matricula) VALUES 
(1, 1, '2022-08-17') 
;

SELECT * FROM tb_diciplinas;
INSERT INTO tb_diciplinas (nome, id_curso, id_professor) VALUES 
('ISTs', 4, 1);

INSERT INTO tb_estudantes (nome, data_nascimento, email, id_curso, data_matricula) VALUES 
('ParaDeletar', CURDATE(), 'teste.delete@email.com', 1, CURDATE())



