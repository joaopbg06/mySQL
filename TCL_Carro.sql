USE db_carro;

SELECT @@autocommit;
SET @@autocommit = OFF;

SELECT * FROM tb_proprietario;		

-- ROLLBACK SIMPLES
-- INSERT

START TRANSACTION;
INSERT INTO tb_proprietario VALUES (
	'6',
    'TESTE',
    '2',
    '1'
);

ROLLBACK;
COMMIT;

-- TRIGGERS

-- Criando a tabela de historico
CREATE TABLE tb_historico_preco (
	id_historico INT(10) AUTO_INCREMENT,
    data_modificacao DATETIME,
    id_carro INT(10) NOT NULL,
    valor_anterior  DECIMAL(10,2),
    valor_novo DECIMAL(10,2),
	PRIMARY KEY (id_historico),
    FOREIGN KEY (id_carro) REFERENCES tb_carro(id_carro)
);
	

/*	Colocando o Trigger para AFTER UPDATE ele inserir na tabela tb_historico_preco
IF NEW.valor <> OLD.valor THEN 
		INSERT  INTO tb_historico_preco VALUES (NULL, NOW(), NEW.id_carro, OLD.valor, NEW.valor);
END IF;
*/

SELECT * FROM tb_historico_preco;	
SELECT * FROM tb_carro;	

UPDATE tb_carro SET valor = 1000 WHERE id_carro = 4;


-- Modificando tb_proprietario
ALTER TABLE tb_proprietario ADD data_nascimento DATE;
SELECT * FROM tb_proprietario;	


-- SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
-- Com essa Trigger ele calcula a idade automatimente

INSERT INTO tb_proprietario (id_proprietario, nome, id_carro, data_nascimento) VALUES (
	'7',
    'Trigger_teste',
    '3',
    '2000-12-12'
);


-- TRIGGER para impedir de deletar um registro do tb_carro se tiver proprietario vinculado

/*
IF (SELECT COUNT(*) FROM tb_proprietarios WHERE id_carro = OLD.id_carro) > 0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Não é possivel excluir um carro com proprietario associado';
END IF;
*/
SELECT * FROM tb_proprietario;	
SELECT * FROM tb_carro;	
DELETE FROM tb_carro WHERE id_carro = '3';

-- Error Code: 1644. Não é possivel excluir um carro com proprietario associado
