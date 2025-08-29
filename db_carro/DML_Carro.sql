USE db_carro;

SELECT * FROM tb_carro;

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES	(
	'5',
    'Intel',
    'i5',
    '2023',
    '86.92',
    'preto-claro',
    '974987102'
);

SELECT * FROM tb_proprietario;

INSERT INTO tb_proprietario (id_proprietario, nome, id_carro, idade) VALUES (
	'5',
    'Edenal do Pereira',
    '5',
    '2'
);

/* Alterar */ 
SELECT * FROM tb_proprietario WHERE id_proprietario = '1';
UPDATE tb_proprietario SET id_carro = '3' WHERE id_proprietario = '1';

SELECT * FROM tb_carro WHERE id_carro = '1';
UPDATE tb_carro SET valor = '1.99' WHERE id_carro = '1';

DELETE FROM tb_carro WHERE id_carro = '1';








