USE clinicavetbd;

-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.

DELIMITER $$
CREATE FUNCTION selecionarPets(
	p_id_cliente INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE qnt_pets INT;
	SELECT COUNT(id_pet) INTO qnt_pets FROM tb_pets GROUP BY id_cliente HAVING id_cliente = p_id_cliente;
    RETURN qnt_pets;
END$$
DELIMITER ;

SELECT selecionarPets('1') AS qnt_pets;

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.

DELIMITER $$
CREATE FUNCTION ultimaConsulta(
	p_id_pet INT
)
RETURNS DATE
READS SQL DATA
BEGIN
	DECLARE ultimaConsulta DATE;
	SELECT MAX(data_atendimento) INTO ultimaConsulta FROM tb_atendimentos WHERE id_pet = p_id_pet;
    RETURN ultimaConsulta;
END$$
DELIMITER ;

SELECT ultimaConsulta('3');

-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.

DELIMITER $$
CREATE FUNCTION totalConsultas(
	p_id_veterinario INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE qnt_consultas INT;
	SELECT COUNT(*) INTO qnt_consultas FROM tb_atendimentos GROUP BY id_veterinario HAVING id_veterinario = p_id_veterinario;
    RETURN qnt_consultas;
END$$
DELIMITER ;

SELECT totalConsultas('3');









