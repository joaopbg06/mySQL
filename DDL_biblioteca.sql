CREATE DATABASE db_biblioteca;

USE db_biblioteca;

CREATE TABLE td_autores (
	id_autor INT(10) NOT NULL UNIQUE,
    nome VARCHAR(50),
    data_nascimento DATE,
    PRIMARY KEY (id_autor)
);

CREATE TABLE td_livros (
	id_livro INT(10) NOT NULL UNIQUE,
    titulo VARCHAR(100),
    ano_publicacao INT(4),
    id_autor INT(10) NOT NULL,
    PRIMARY KEY (id_livro),
    FOREIGN KEY (id_autor) REFERENCES td_autores(id_autor)
);

CREATE TABLE td_membros(
	id_membro INT(10) NOT NULL UNIQUE,
    nome VARCHAR(50),
    data_adesao DATE,
    PRIMARY KEY (id_membro)
);

CREATE TABLE td_emprestimos (
	id_emprestimo INT(10) NOT NULL UNIQUE, 
    id_membro INT(10) NOT NULL,
    id_livro INT(10) NOT NULL,
    data_emprestimo DATE,
    data_devolucao DATE,
    PRIMARY KEY (id_emprestimo),
    FOREIGN KEY (id_membro) REFERENCES td_membros(id_membro),
    FOREIGN KEY (id_livro) REFERENCES td_livros(id_livro)
);

SELECT * FROM td_autores;
SELECT * FROM td_livros;
SELECT * FROM td_membros;
SELECT * FROM td_emprestimos;


	
