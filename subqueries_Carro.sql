-- Subqueries - carro
USE db_carro;

-- 1. Quais carros tem um preço acima da média
-- SEPARADO
SELECT AVG(valor) FROM tb_carro;
SELECT * FROM tb_carro WHERE valor > '2500125.477500';

-- JUNTO
SELECT * FROM tb_carro WHERE valor > (SELECT AVG(valor) FROM tb_carro);














