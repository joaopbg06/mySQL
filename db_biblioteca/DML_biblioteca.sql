USE db_biblioteca;


INSERT INTO td_autores (id_autor, nome, data_nascimento) VALUES (
	'5',
    'Karl Marx',
    '1818-03-14'
);


SELECT * FROM td_membros WHERE id_membro = '2'; 

UPDATE td_membros SET nome = 'Messi', data_adesao = '1919-12-01' WHERE id_membro = '2'; 




INSERT INTO td_livros (id_livro, titulo, ano_publicacao, id_autor) VALUES (
	'5',
    'Turma da Mônica',
    '1959',
    '2'
);


SELECT * FROM td_livros;


INSERT INTO td_membros (id_membro, nome, data_adesao) VALUES (
	'5',
    'Josef Stalin',
    '1980-01-04'
);


SELECT * FROM td_membros;

INSERT INTO td_emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES (
	'5',
    '2',
    '1',
    '1857-09-30',
    '1947-06-06'
);

SELECT * FROM td_emprestimos;

