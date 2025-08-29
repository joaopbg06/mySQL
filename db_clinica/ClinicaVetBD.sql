-- 1 Criação do Banco de Dados
CREATE DATABASE ClinicaVetBD;

USE ClinicaVetBD;

-- 2 Criação das Tabelas
CREATE TABLE tb_veterinarios (
	id_veterinario INT(10) NOT NULL,
    nome VARCHAR(100),
    especialidade VARCHAR(50),
    telefone VARCHAR(11),
    PRIMARY KEY(id_veterinario)
);

CREATE TABLE tb_clientes (
	id_cliente INT(10) NOT NULL,
	nome VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(11),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE tb_pets (
	id_pet INT(10) NOT NULL,
	nome VARCHAR(100),
    tipo VARCHAR(50),
    raca VARCHAR(50),
    data_nascimento DATE,
    id_cliente INT(10) NOT NULL,
    PRIMARY KEY(id_pet),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_atendimentos (
	id_atendimento INT(10) NOT NULL,
    id_pet INT(10) NOT NULL,
    id_veterinario INT(10) NOT NULL,
    data_atendimento DATE,
    descricao VARCHAR(100),
    PRIMARY KEY(id_atendimento),
    FOREIGN KEY (id_pet) REFERENCES tb_pets(id_pet),
    FOREIGN KEY (id_veterinario) REFERENCES tb_veterinarios(id_veterinario)
);

-- 3 Inserir ao menos 3 valores em cada tabela
SELECT * FROM tb_atendimentos;
INSERT INTO tb_atendimentos (id_atendimento, id_pet, id_veterinario, data_atendimento, descricao) 
VALUES	(
	'6',
    '4',
    '2',
    '2025-03-18',
    'Teste'
);

SELECT * FROM tb_pets;
INSERT INTO tb_pets (id_pet, nome, tipo, raca, data_nascimento, id_cliente) 
VALUES	(
	'4',
    'Batman',
    'morcego',
    'ozzy',
    '2022-08-17',
    '1'
);

SELECT * FROM tb_clientes;
INSERT INTO tb_clientes (id_cliente, nome, endereco, telefone) 
VALUES	(
	'3',
    'Alexandre de Morais',
    'rua getulio vargas',
    '11991859837'
);


SELECT * FROM tb_veterinarios;
INSERT INTO tb_veterinarios (id_veterinario, nome, especialidade, telefone) 
VALUES	(
	'3',
    'Trump',
    'diagnostico por Imagem',
    '11992937528'
);

-- 4 Realize ao menos 5 alterações
SELECT * FROM tb_veterinarios WHERE id_veterinario = '3';
UPDATE tb_veterinarios SET nome = 'Bolsonaro' WHERE id_veterinario = '3';

SELECT * FROM tb_veterinarios WHERE id_veterinario = '2';
UPDATE tb_veterinarios SET especialidade = 'nutricao' WHERE id_veterinario = '2';

SELECT * FROM tb_clientes WHERE id_cliente = '2';
UPDATE tb_clientes SET nome = 'Lula' WHERE id_cliente = '2';

SELECT * FROM tb_clientes WHERE id_cliente = '1';
UPDATE tb_clientes SET endereco = 'rua dezoito' WHERE id_cliente = '1';

SELECT * FROM tb_pets WHERE id_pet = '1';
UPDATE tb_pets SET tipo = 'ave', raca = 'papagaio-do-congo' WHERE id_cliente = '1';


-- 5 Realize as seguintes consultas:
SELECT * FROM tb_pets;
SELECT * FROM tb_clientes;
SELECT * FROM tb_veterinarios;
SELECT * FROM tb_atendimentos;

-- a. O pet com a data de nascimento mais antigo
SELECT * FROM tb_pets ORDER BY data_nascimento ASC LIMIT 1;

-- b. O pet com a data de nascimento mais recente
SELECT * FROM tb_pets ORDER BY data_nascimento DESC LIMIT 1;

-- c. A quantidade de pets cadastrados no banco de dados
SELECT COUNT(id_pet) FROM tb_pets;

-- d. Ordene o nome dos pets em ordem crescente
SELECT * FROM tb_pets ORDER BY nome ASC;

-- e. Ordene o nome dos pets em ordem decrescente
SELECT * FROM tb_pets ORDER BY nome DESC;

-- f. Ordene o nome dos veterinários em ordem crescente
SELECT * FROM tb_veterinarios ORDER BY nome ASC;

-- g. Ordene o nome dos veterinários em ordem decrescente
SELECT * FROM tb_veterinarios ORDER BY nome DESC;

-- h. A data de atendimento mais antiga
SELECT MIN(data_atendimento) AS 'Data Mais Antiga' FROM tb_atendimentos;

-- i. A data de atendimento mais recente
SELECT MAX(data_atendimento) AS 'Data Mais Nova' FROM tb_atendimentos;


