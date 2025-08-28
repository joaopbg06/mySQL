USE db_carro;

-- INNER JOIN
SELECT * FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON C.id_carro = P.id_carro;

--

SELECT * FROM tb_proprietario AS P
RIGHT JOIN tb_carro AS C
ON C.id_carro = P.id_carro;

