USE db_carro;

-- calculo de vendar por carro exemplo 
delimiter $$

create function valorMarca(
	p_marca varchar(100)
)
returns decimal(10,2)

reads sql data
begin
	declare valorTotal decimal(10,2);
	select sum(valor * numero_vendas) into valorTotal from tb_carro where marca = p_marca;
    return valorTotal;
end$$

delimiter ;
select * from tb_carro;
select valorMarca('SENAI');

