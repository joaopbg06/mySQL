/* Cria o banco de dados */
CREATE DATABASE db_carro; 

/* Seleciona o banco de dados que vai ser usado */
USE db_carro; 

/* Criação de tabela e suas colunas */
CREATE TABLE tb_carro (
	id_carro INT(10) NOT NULL,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    ano INT(4),
    valor DECIMAL(10,2),
    cor VARCHAR(100),
    numero_vendas INT(10),
    PRIMARY KEY (id_carro)
);

/* Seleciona tudo sobre a tabela tb_carro*/
SELECT * FROM tb_carro;

/* Seleciona apenas a marca sobre a tabela tb_carro*/
SELECT marca FROM tb_carro;

/* Seleciona a marca modelo e ano sobre a tabela tb_carro*/
SELECT marca, modelo, ano FROM tb_carro;

CREATE TABLE tb_proprietario (
	id_proprietario INT(10) NOT NULL,
    nome VARCHAR(100),
    id_carro INT(10) NOT NULL,
    PRIMARY KEY (id_proprietario),
	FOREIGN KEY (id_carro) REFERENCES tb_carro(id_carro)
);

SELECT * FROM tb_proprietario;

/* Alterar uma tabela*/
ALTER TABLE tb_proprietario ADD idade INT(3);

CREATE TABLE tb_historico (
	id_historico INT(10) NOT NULL,
    data_modificacao DATETIME,
    id_carro INT(10) NOT NULL,
    valor_anterior DECIMAL(10,2),
	valor_novo DECIMAL(10,2),
    PRIMARY KEY (id_historico),
    FOREIGN KEY (id_carro) REFERENCES tb_carro(id_carro)
);

SELECT * FROM tb_historico;
