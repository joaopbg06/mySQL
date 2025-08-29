USE clinicavetbd;

-- 1. Liste o nome e a data de nascimento do pet mais antigo da clínica usando uma subquery.
SELECT nome, data_nascimento FROM tb_pets WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM tb_pets);

-- 2. Liste o nome e a data de nascimento do pet mais novo usando uma subquery.
SELECT nome, data_nascimento FROM tb_pets WHERE data_nascimento = (SELECT MAX(data_nascimento) FROM tb_pets);

-- 3. Liste o nome de todos os veterinários que realizaram atendimentos na data mais recente registrada.
SELECT nome FROM tb_veterinarios 
WHERE id_veterinario IN (SELECT id_veterinario FROM tb_atendimentos WHERE data_atendimento = (SELECT MAX(data_atendimento) FROM tb_atendimentos));

-- 4. Liste os nomes dos clientes que possuem mais de um pet, utilizando uma subquery para contar a quantidade.
SELECT nome FROM tb_clientes 
WHERE id_cliente IN (SELECT id_cliente FROM tb_pets GROUP BY id_cliente HAVING NOT COUNT(*) = 1);

-- 5. Liste o nome de todos os pets que ainda não passaram por atendimento, utilizando uma subquery para verificar.
SELECT * FROM tb_pets WHERE id_pet NOT IN (SELECT DISTINCT id_pet FROM tb_atendimentos);

-- 6. Para cada cliente, mostre o nome e a quantidade de pets cadastrados, utilizando uma subquery no SELECT.
SELECT nome, total_pets
FROM tb_clientes AS C
INNER JOIN (
	 SELECT id_cliente, COUNT(*) AS total_pets  FROM tb_pets  GROUP BY id_cliente 
) T ON C.id_cliente = T.id_cliente;


-- 7. Liste todos os atendimentos realizados pelo veterinário mais recentemente cadastrado no sistema.
SELECT * FROM tb_atendimentos
WHERE id_veterinario = (SELECT MAX(id_veterinario) FROM tb_veterinarios);

-- 8 Liste todas as informações do atendimento mais antigo registrado, usando uma subquery para identificar a data.
SELECT * FROM tb_atendimentos 
WHERE data_atendimento = (SELECT MIN(data_atendimento) FROM tb_atendimentos	);

-- 9. Liste os nomes dos clientes que já tiveram atendimentos com pelo menos dois veterinários distintos, usando subquery.
SELECT C.nome FROM tb_clientes AS C
INNER JOIN tb_pets AS P
ON P.id_cliente = C.id_cliente
WHERE id_pet IN (
	SELECT id_pet 
	FROM tb_atendimentos GROUP BY id_pet 
	HAVING  COUNT(DISTINCT id_veterinario) >= 2
);

-- 10. Liste os nomes dos pets que foram atendidos pelo veterinário que mais realizou atendimentos na clínica, usando subquery para identificar esse veterinário.
SELECT DISTINCT  nome
FROM tb_atendimentos  AS A
INNER JOIN tb_pets AS P
ON A.id_pet = P.id_pet
WHERE id_veterinario = (SELECT id_veterinario  FROM tb_atendimentos GROUP BY id_veterinario ORDER BY COUNT(*) DESC LIMIT 1);

