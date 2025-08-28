USE ClinicaVetBD;

-- INNER JOIN 

-- 1
SELECT P.nome, C.nome, telefone 
FROM tb_pets AS P
INNER JOIN tb_clientes AS C
ON P.id_cliente = C.id_cliente;

-- 2
SELECT data_atendimento, descricao, P.nome, V.nome 
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P
ON A.id_pet = P.id_pet
INNER JOIN tb_veterinarios AS V
ON A.id_veterinario = V.id_veterinario;

-- 3 
SELECT V.nome, P.nome 
FROM tb_veterinarios AS V
INNER JOIN tb_atendimentos AS A
ON V.id_veterinario = A.id_veterinario
INNER JOIN tb_pets AS P
ON A.id_pet = P.id_pet;

-- 4
SELECT C.nome, P.nome, especialidade
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P
ON A.id_pet = P.id_pet
INNER JOIN tb_veterinarios AS V
ON A.id_veterinario = V.id_veterinario
INNER JOIN tb_clientes AS C
ON P.id_cliente = C.id_cliente;


-- LEFT JOIN

-- 5 
SELECT C.nome, telefone, P.nome, raca
FROM tb_clientes AS C 
LEFT JOIN tb_pets AS P
ON C.id_cliente = P.id_cliente;

-- 6 
SELECT *
FROM tb_veterinarios AS V
LEFT JOIN tb_atendimentos AS A
ON V.id_veterinario  = A.id_veterinario;

-- RIGHT JOIN

-- 7 
SELECT P.nome, raca, C.nome, telefone
FROM tb_clientes AS C 
RIGHT JOIN tb_pets AS P
ON C.id_cliente = P.id_cliente;

-- 8
SELECT *
FROM tb_veterinarios AS V
RIGHT JOIN tb_atendimentos AS A
ON  A.id_veterinario = V.id_veterinario;




