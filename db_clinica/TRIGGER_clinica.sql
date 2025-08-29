USE clinicavetbd;
/* 
Exercício 1. Crie um trigger que, sempre que um novo pet for inserido na tabela,
calcule automaticamente a idade do pet com base em sua data de nascimento e
armazene esse valor na coluna idade.
*/

SELECT * FROM tb_pets;

ALTER TABLE tb_pets ADD idade INT(3);

/*
SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE()); 
*/

INSERT INTO tb_pets VALUES (
	'5',
    'Bananine',
    'macaco',
    'chimpazé',
    '2000-01-01',
    '2',
    NULL
);
