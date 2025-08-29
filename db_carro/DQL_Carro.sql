USE db_carro;

SELECT * FROM tb_carro;

SELECT cor FROM tb_carro;

SELECT cor, modelo FROM tb_carro;

SELECT * FROM tb_carro WHERE cor ='negro';

SELECT * FROM tb_carro WHERE modelo ='apple';

SELECT min(valor) FROM tb_carro;
SELECT max(ano) FROM tb_carro;

SELECT count(id_carro) FROM tb_carro;

SELECT sum(valor) FROM tb_carro;

SELECT * FROM tb_carro ORDER BY modelo ASC;
SELECT * FROM tb_carro ORDER BY marca DESC;

SELECT COUNT(marca) FROM tb_carro WHERE ano >= '2001' && ano <= '2023';
SELECT COUNT(id_carro) AS 'Total Registros', marca FROM tb_carro WHERE ano BETWEEN '2001' AND '2023' GROUP BY marca;

SELECT COUNT(id_carro) AS 'Registro de 1304', marca FROM tb_carro WHERE ano = '1304' GROUP BY marca;


