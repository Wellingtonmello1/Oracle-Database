-- Para visualizar a TABELA_DE_VENDEDORES
select * from tabela_de_vendedores;

--Para visualizar a tabela NOTAS_FISCAIS,
select * from notas_fiscais;

--Para mostrar quantas notas fiscais cada vendedor vendeu
select matricula, count(*) as numero_de_notas
from notas_fiscais
group by matricula;

--Para ver o nome do vendedor na visualização,
select notas_fiscais.matricula, tabela_de_vendedores.nome, count(*) as numero_de_notas
from notas_fiscais inner join tabela_de_vendedores
on notas_fiscais.matricula = tabela_de_vendedores.matricula
group by notas_fiscais.matricula, tabela_de_vendedores.nome;

--Acertando a ordem das tabelas
select notas_fiscais.matricula, tabela_de_vendedores.nome, count(*) as numero_de_notas
from tabela_de_vendedores inner join notas_fiscais
on notas_fiscais.matricula = tabela_de_vendedores.matricula
group by notas_fiscais.matricula, tabela_de_vendedores.nome;

--Para saber quais clientes fizeram uma compra
select distinct 
tc.cpf as CPF_DO_CLIENTE , tc.nome as NOME_DO_CLIENTE , nf.CPF as CPF_DA_NOTA
from tabela_de_clientes tc
inner join notas_fiscais nf
on tc.cpf = nf.cpf;

-- clientes que tem cadastro
select count(*) from tabela_de_clientes;

-- adicione um novo cliente
insert into tabela_de_clientes
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, 
SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) 
VALUES ('23412632331', 'Juliana Silva', 'R. Tramandai', '', 'Bangu', 'Rio de Janeiro', 
'RJ', '23400000', TO_DATE('1989-02-04','YYYY-MM-DD'), 28, 'F', 180000.0000, 24500, 0);

-- Mostre quantos clientes tem
select count (*) from tabela_de_clientes;

--Para mostrar todos os clientes (left join)
select distinct
tc.cpf as CPF_DO_CLIENTE , tc.nome as NOME_DO_CLIENTE , nf.cpf as CPF_DA_NOTA
from tabela_de_clientes tc
left join notas_fiscais nf
on tc.cpf = nf.cpf;

-- mostrar clientes que nunca compraram
select distinct
tc.cpf as CPF_DO_CLIENTE , tc.nome as NOME_DO_CLIENTE , nf.cpf as CPF_DA_NOTA
from tabela_de_Clientes tc
left join notas_fiscais nf
on tc.cpf = nf.cpf
where nf.cpf is null;

--tirar a coluna indesejada CPF_NOTAS_FISCAIS

select DISTINCT
tc.cpf as CPF_CADASTRADO ,
nf.cpf as CPF_DA_NOTA
from tabela_de_clientes tc
left join notas_fiscais nf
on tc.cpf = nf.cpf
where nf.cpf is null;

--Faça o JOIN pelo campo BAIRRO
select distinct
tv.nome as Name_seller , tv.bairro as Bairro_seller , 
tc.nome as name_buyer , 
tc.bairro as Bairro_Buyer
from tabela_de_Clientes tc
inner join tabela_de_vendedores tv
on tv.bairro = tc.bairro;


--Na tabela de notas fiscais, temos o valor do imposto. Já na tabela de itens, temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016, arredondando para o menor inteiro.

select * from notas_fiscais;

select to_char(data_venda,'YYYY'), floor(sum(imposto * (quantidade * preco)))
from notas_fiscais nf
inner join itens_notas_fiscais INF
on nf.numero = inf.numero
where to_char(data_venda, 'YYYY') = 2016
group by to_char(data_venda, 'YYYY');


-- vendas 
select
tc.cpf,tc.nome,tc.volume_de_compra,tv.mes_ano, tv.total,
(case when tc.volume_de_compra >= tv.total then 'validas'
else 'invalidas' end) as resultado
from
tabela_de_clientes tc
inner join
(
SELECT
nf.cpf,
to_char(nf.data_venda, 'mm-yyyy') as mes_ano,
sum(inf.quantidade) as total
FROM
notas_fiscais nf
INNER JOIN
itens_notas_fiscais inf
ON  nf.numero = inf.numero
group by
cpf, to_char(nf.data_venda, 'mm-yyyy'))tv
ON
tv.CPF = tc.cpf; 

-- cliente quer ranking de sabor

select
tp.sabor,
extract (year from nf.data_venda) as ano,
sum(inf.quantidade) as total
from
tabela_de_produtos tp
inner join
itens_notas_fiscais inf
On tp.codigo_do_produto  = inf.codigo_do_produto
inner join
notas_fiscais nf
on inf.numero = nf.numero
where extract (year from nf.data_venda) = 2016
group by
tp.sabor, extract (year from nf.data_venda)
order by sum(inf.quantidade)desc;

-- coloque o percentual 










