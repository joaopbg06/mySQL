CREATE DATABASE db_academica;

USE db_academica;

CREATE TABLE tb_cursos(
	id_curso INT AUTO_INCREMENT ,
    nome VARCHAR(100) NOT NULL,
    duracao_anos INT NOT NULL,
    PRIMARY KEY (id_curso)
);

CREATE TABLE tb_professores(
	id_professor INT AUTO_INCREMENT ,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    ano_admissao DATE NOT NULL,
    PRIMARY KEY (id_professor)
);

CREATE TABLE tb_diciplinas(
	id_diciplina INT AUTO_INCREMENT ,
    nome VARCHAR(100) NOT NULL,
    id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    PRIMARY KEY (id_diciplina),
    FOREIGN KEY (id_curso) REFERENCES tb_cursos(id_curso),
    FOREIGN KEY (id_professor) REFERENCES tb_professores(id_professor)	
);

CREATE TABLE tb_estudantes(
	id_estudante INT AUTO_INCREMENT ,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) NOT NULL UNIQUE,
    id_curso INT NOT NULL,
    data_matricula DATE NOT NULL,
    PRIMARY KEY (id_estudante),
	FOREIGN KEY (id_curso) REFERENCES tb_cursos(id_curso)
);

CREATE TABLE tb_matriculas(
	id_matricula INT AUTO_INCREMENT,
    id_estudante INT NOT NULL,
    id_diciplina INT NOT NULL,
    data_matricula DATE ,
    PRIMARY KEY (id_matricula),
	FOREIGN KEY (id_estudante) REFERENCES tb_estudantes(id_estudante),
    FOREIGN KEY (id_diciplina) REFERENCES tb_diciplinas(id_diciplina)
);


CREATE TABLE tb_notas(
	id_nota INT AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    nota DECIMAL (5,2),
    data_lancamento DATE,
    PRIMARY KEY (id_nota),
	FOREIGN KEY (id_matricula) REFERENCES tb_matriculas(id_matricula)
   
);
