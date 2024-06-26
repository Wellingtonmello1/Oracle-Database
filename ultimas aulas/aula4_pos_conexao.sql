alter table clientes
rename column column10 to volume_compra; 

alter table clientes
modify volume_compra number;

select * from clientes;

delete from clientes where cpf = '1471156710';

select * from vendedores;

select * from notas;

-- finalizado importação e leitura

select * from produtos where codigo = '1040107';

update produtos set preco_lista = 5.2 where codigo = '1040107';

UPDATE produtos set sabor = 'laranja', embalagem = 'pet' where codigo = '1040107';

--replace altera um pedaço de um texto

select * from produtos where codigo = '1040107';

select descritor, replace(descritor, 'melancia', 'Laranja') from produtos where codigo = '1040107';

-- ou pode fazer update

update produtos set descritor =         replace(descritor, 'melancia', 'Laranja') from produtos where codigo = '1040107';

-- alterar em blocos

select * from produtos where sabor = 'Maracuja';

update produtos set preco_lista = preco_lista * 1.10 where sabor = 'Maracuja';







