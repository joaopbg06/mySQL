USE db_carro;

-- STORAGE PROCEDURE 
-- Armazena um bloco de código, onde suporta multiplas operações (INSERT, UPDATE, DELETE)

-- Criar uma PROCEDURE que insira um novo carro na tabela

-- IN - parametro de entrada
-- OUT - paramento de saída

DELIMITER $$
 -- Muda o limitador de ; para $$
CREATE PROCEDURE inserirCarro  (
	IN p_id_carro INT,
    IN p_marca VARCHAR(100),
    IN p_modelo VARCHAR(100),
    IN p_ano INT,
    IN p_valor DECIMAL(10,2),
    IN p_cor VARCHAR(100),
    IN p_numerosVendas INT
)
BEGIN 
	INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas) 
    VALUES (p_id_carro, p_marca, p_modelo, p_ano, p_valor, p_cor, p_numerosVendas);
END $$


CALL inserirCarro('8', 'Fandangos', 'cheddar', '2020', '20000', 'laranja', '1') $$

SELECT * FROM tb_carro $$



