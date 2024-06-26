--- FUNCOES TIPO TEXTO
-- funcao lower, pega um texto e deixa tudo em minusculo
-- upper, ao contrario
-- initcap apenas a primeira letra maiuscula
-- concat pega por exemplo o nome completo e deixa o primeiro e ultimo nome em um so texto
-- Lpad adiciona acrescenta caractere ou seja, se o texto precisa de 5 e tiver 2, ele preenche o restante
-- substr tira um pedaco do texto dentro do texto maior
-- instr se um caracte esta no texto, ira indicar se tem, se nao tiver ele indicara
-- ltrim tira uns espaço da esquerda
-- rtrim tira da direita
-- trim  dos dois
-- translate traduz ou subistitu um A por um *
-- replace ....

--funcoes strings

SELECT * FROM TABELA_DE_CLIENTES;

select nome, lower(nome), upper(nome) from tabela_de_clientes;

select NOME_DO_PRODUTO, initcap(NOME_DO_PRODUTO) from tabela_de_produtos;

select endereco_1, bairro, concat(endereco_1, bairro) from tabela_de_clientes;

select endereco_1, bairro, concat(endereco_1, ' ') from tabela_de_clientes;

select endereco_1 ||' '|| bairro ||' '|| estado from tabela_de_clientes;

select nome_do_produto, lpad(nome_do_produto,70,'*')from tabela_de_produtos;

select nome_do_produto, rpad(nome_do_produto,70,'*')from tabela_de_produtos;

select nome_do_produto, substr(nome_do_produto,6,9)from tabela_de_produtos;

select nome_do_produto, instr(nome_do_produto,'3')from tabela_de_produtos;

select nome, instr(nome, 'mattos') from tabela_de_clientes;

select nome from tabela_de_clientes where instr(nome,'Mattos') <> 0;

select '   VICTORINO   ' AS X , ltrim ('   VICTORINO  ') AS Y from dual;

select '   VICTORINO   ' AS X , ltrim ('   VICTORINO  ') AS Y , Rtrim ('   VICTORINO  ') AS Z from dual;

Select '   VICTORINO   ' AS X , ltrim ('   VICTORINO  ') AS Y , Rtrim ('   VICTORINO  ') AS Z, trim ('   VICTORINO  ') AS O from dual;

select nome_do_produto from tabela_de_produtos;

select nome_do_produto, replace(replace(nome_do_produto,'Litro','L'),'Ls','L') from tabela_de_produtos;

-- funcoes datas

select sysdate from dual;

select to_char(sysdate, 'DD/MM/YYYY HH:MI:SS') from dual;

select nome, data_de_nascimento from tabela_de_Clientes;

select nome, to_char(data_de_nascimento, 'dd month yyyy, day') from tabela_de_clientes;

select sysdate + 127 from dual;

select nome, idade, to_char(data_de_nascimento, 'dd month yyyy, day') from tabela_de_clientes;

select nome, idade, (sysdate - data_de_nascimento)/365 from tabela_de_clientes;

select nome, idade, months_between (sysdate, data_de_nascimento)/12 from tabela_de_clientes;

select add_months(sysdate, 10) from dual;

select sysdate, next_day(sysdate, 'sexta') from dual;

select sysdate, last_day(sysdate) from dual;

select sysdate + 200, trunc(sysdate,'month') from dual;

select sysdate , round(sysdate,'year') from dual;

select NOME, to_char(DATA_DE_NASCIMENTO,'dd "de" MONTH "de" YYYY') from TABELA_DE_CLIENTES;

-- contas 
select round(3.4) from dual;

select round(3.6) from dual;

select round(3.5) from dual;

select trunc(3.4) from dual;

select trunc(3.6) from dual;

select trunc(3.5) from dual;

select ceil(3.4) from dual;

select ceil(3.6) from dual;

select ceil(3.5) from dual;

select floor(3.4) from dual;

select floor(3.6) from dual;

select floor(3.5) from dual;

select power(10,4) from dual;

select power(34,4) from dual;

select exp(4) from dual;

select sqrt (144) from dual;

select sqrt (10) from dual;

select abs (10) from dual;

select abs (-10) from dual;

select mod(10,6) from dual;


-- to_number converte string em numero
-- to_char converte para numero

--Existem algumas formas de representação de saída do número:

9 - Posição numérica - Ex: 9999 - 1234

0 - Zeros antes do número - Ex: 009999 = 001234

$ - Símbolo de moeda - Ex: $9999 = $1234

. - Usar o ponto como separador - EX: 9999.99 = 1234.12

, - Usar a vígula como separador - Ex: 9999,99 = 1234,12

MI - Símbolo negativo do lado direito do número

PR - Número negativo em parênteses

EEEE - Notação científica 

--extract

select extract(month from to_date('12/11/2019', 'dd/mm/yyyy')) from dual;

select extract(month from to_date('12/11/2019', 'mm/dd/yyyy')) from dual;

select 10 + 10 from dual;

select to_number('10') + 10 from dual;

select to_char(1234.123,'9999') from dual;

select nvl (null,0) from dual;

select 

nvl(tv.nome,'Náo encontrado') as nome_vendedor,
nvl(tv.bairro, 'Náo encontrado') as bairro_vendedor,
nvl(tc.nome, 'Nao encontrado') as nome_cliente,
nvl(tc.bairro,'Nao encontrado') as Bairro_cliente

from tabela_de_vendedores tv
full join tabela_de_clientes tc
on tv.bairro = tc.bairro;


--vendas

SELECT * FROM TABELA_DE_CLIENTES;
select * from notas_fiscais;
select * from itens_notas_fiscais;

--VER SE UM CLINTE PASSOU DO NUMERO TOTAL DE COMPRAS

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
cpf, to_char(nf.data_venda, 'mm-yyyy');

select cpf, nome, volume_de_compra from tabela_de_clientes;

--Consulta abaixo mostra uma subquery mostra o mes e ano
select
tc.cpf,tc.nome,tc.volume_de_compra,tv.mes_ano, tv.total
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
-- Gabriel araujo teve sua venda valida mes 2 mas nao no mes 1

--adicionando case when, then, else e and para ver se a venda é valida
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


--vendo em um mes ou data especifica
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
tv.CPF = tc.cpf
where tv.mes_ano = '02-2015'
and (tc.volume_de_compra - tv.total) <0; 

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

-- valor total de todos sabores vendidos em 2016

select total_ano.total from 
    (select
    extract(year from nf.data_venda) as ano,
    sum(inf.quantidade) as total
        from
        notas_fiscais nf
        inner join
        itens_notas_fiscais inf
        on nf.numero = inf.numero
        where extract(year from nf.data_venda) = 2016
            group by
            extract(year from nf.data_venda)) total_ano;


-- 
select 
consulta_relatorio.sabor,
consulta_relatorio.ano,
consulta_relatorio.total,
round((consulta_relatorio.total/consulta_relatorio.quantidade_geral)*100,2) as percentual_participacao
    from
        (select
        tp.sabor,
        extract (year from nf.data_venda) as ano,
        sum(inf.quantidade) as total,
                (select total_ano.total from 
                    (select
                    extract(year from nf.data_venda) as ano,
                    sum(inf.quantidade) as total
                        from
                        notas_fiscais nf
                        inner join
                        itens_notas_fiscais inf
                        on nf.numero = inf.numero
                        where extract(year from nf.data_venda) = 2016
                        group by
                        extract(year from nf.data_venda)) total_ano
                        ) as quantidade_geral
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
                            order by sum(inf.quantidade)desc) consulta_relatorio;

--
