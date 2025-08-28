USE clinicavetbd;

-- EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.


DELIMITER $$ 
CREATE PROCEDURE inserirVeterinario (
	IN p_id_veterinario INT,
    IN p_nome VARCHAR(100),
	IN p_especialidade VARCHAR(100),
    IN p_telefone INT
)
BEGIN
	INSERT INTO tb_veterinarios (id_veterinario, nome, especialidade, telefone) 
    VALUES (p_id_veterinario, p_nome, p_especialidade, p_telefone);
END $$

DELIMITER ;

CALL inserirVeterinario ('4', 'teste_procedure', 'retornar', '992633622');
SELECT * FROM tb_veterinarios;



-- EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.

DELIMITER $$ 
CREATE PROCEDURE atualizarCliente (
	IN p_id_cliente INT,
    IN p_nome VARCHAR(100),
	IN p_endereco VARCHAR(100),
    IN p_telefone INT
)
BEGIN
	UPDATE tb_clientes 
    SET 
    nome = p_nome,
    endereco = p_endereco,
    telefone = p_telefone
    WHERE id_cliente = p_id_cliente;
    
END $$

DELIMITER ;

CALL atualizarCliente ('2', 'Genivaldo', 'saudosa maloca', '1584682487');

SELECT * FROM tb_clientes;

-- EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.

DELIMITER $$ 
CREATE PROCEDURE registrarAtendimento (
	IN p_id_atendimento INT,
    IN p_id_pet INT,
	IN p_id_veterinario INT,
    IN p_data_atendimento DATE,
    IN p_descricao VARCHAR(100)
)
BEGIN
	IF 
		p_id_pet IN (SELECT DISTINCT id_pet FROM tb_pets) 
		AND
		p_id_veterinario IN (SELECT DISTINCT id_veterinario FROM tb_veterinarios) 
	THEN 
		INSERT INTO tb_atendimentos (id_atendimento, id_pet, id_veterinario, data_atendimento, descricao)
		VALUES (p_id_atendimento, p_id_pet, p_id_veterinario, p_data_atendimento, p_descricao);
	ELSE 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O id_pet ou o id_veterinario não existem';
	END IF;
END $$
DELIMITER ;

CALL registrarAtendimento ('7', '2', '2', '2020-01-01', 'teste');

SELECT * FROM tb_atendimentos;

-- Error Code: 1644. O id_pet ou o id_veterinario não existem



