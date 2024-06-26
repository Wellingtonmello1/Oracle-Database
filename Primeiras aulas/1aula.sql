select * from tabela_de_clientes;

select cpf, nome, bairro, cidade from tabela_de_clientes;

select nome, cpf, cidade, bairro from tabela_de_clientes;

select cpf AS identificador, nome as "Nome de cliente", bairro, cidade from tabela_de_clientes;

select cpf AS identificador, nome as "Nome de cliente", TDC.bairro, cidade from tabela_de_clientes TDC;

-- Agora. aplicando "where".

-- where 1=1 quando o primeiro (1) repesenta o nome da coluna e depois do "=" o (1) vai buscar todos os verdadeiros da coluna 

select * from tabela_de_produtos;

select * from tabela_de_produtos where 1=1;

select * from tabela_de_produtos where nome_do_produto = 'Sabor da Montanha - 700 ml - Uva';

select * from tabela_de_produtos where sabor = 'Laranja';

select * from tabela_de_produtos where embalagem = 'PET';

-- o nome tem que estar de acordo com descrito, sendo as maiúsculas e a minúscula

-- >, <, =, =<, ou >= sera selecionado no WHERE, SQL vai seguir sempre a ordem alfabetica

select * from tabela_de_clientes where bairro > 'Lapa';

select * from tabela_de_clientes where idade > 25;

select * from tabela_de_clientes where idade < 25;

select * from tabela_de_clientes where idade <> 25;

-- o mesmo vale pra data

select * from tabela_de_clientes where data_de_nascimento > '01/02/1994';

select * from tabela_de_clientes where data_de_nascimento < '01/02/1996';

-- Em casos de data americana tem que mudar o mes primeiro dps o dia. MM/DD/AAAA e escrever que deseja nessa ordem 

select * from tabela_de_clientes where data_de_nascimento >= to_date('11/14/1993','MM/DD/YYYY');

select * from tabela_de_clientes where idade BETWEEN 18 and 27;

select * from tabela_de_produtos;

-- usando logica de OR e AND com NOT(inverter resultado)

select * from tabela_de_produtos where Sabor = 'Manga' or tamanho = '470 ml';

select * from tabela_de_produtos where Sabor = 'Manga' and tamanho = '470 ml';

select * from tabela_de_produtos where not (Sabor = 'Manga' and tamanho = '470 ml');

-- a ultima expressao nao puxou 'Frescor do Verao - 470 ml - Manga',

select * from tabela_de_produtos where sabor = 'Manga' or sabor = 'Uva' or sabor = 'Laranja';

--puxou os 3 sabores 

select * from tabela_de_produtos where sabor = 'Manga' or sabor = 'Uva' or sabor = 'Laranja';
select * from tabela_de_produtos where sabor in ('Manga','Uva','Laranja');

-- mesma expressão lógica pois 2 'Or' é a mesma coisa que 'in'

select * from tabela_de_produtos where sabor in ('Manga','Uva','Laranja') and tamanho = '1 Litro';

select * from tabela_de_clientes where cidade in ('Rio de Janeiro','Sao Paulo');
select * from tabela_de_clientes where cidade in ('Rio de Janeiro','Sao Paulo') and idade >= 20;
select * from tabela_de_clientes where cidade in ('Rio de Janeiro','Sao Paulo') and (idade >= 20 and idade <= 25);
select * from tabela_de_clientes where cidade in ('Rio de Janeiro','Sao Paulo') and (idade BETWEEN 20 and 25);

-- Usando Like

select * from tabela_de_produtos where sabor in ('Lima/Limao','Morango/Limao');

-- Like é usado pra achar algo em um texto que contem um caracter, como (buscar limao em algo na planilha que estaja escrito limao)

select * from tabela_de_produtos where sabor like '%Limao';

-- o % traz o que tiver escrito atras ou na frente de onde ele for colocado

select * from tabela_de_produtos where sabor like 'Morango%';

select * from tabela_de_produtos where sabor like '%Morango';

select * from tabela_de_produtos where sabor like 'Morango%' and embalagem = 'PET';

select * from tabela_de_clientes where nome like '%Silva%';

-- distinct vai pegar as 3 variaves existente sem repetir

select embalagem from tabela_de_produtos;

select distinct embalagem from tabela_de_produtos;

select distinct embalagem from tabela_de_produtos where sabor ='Maca';

select distinct embalagem, sabor from tabela_de_produtos;

-- O ultimo comando mostra a lista distinta de sabor se repetir

select distinct sabor from tabela_de_produtos;

-- Rownum limita o numero de linhas

select * from tabela_de_produtos;

select rownum, tabela_de_produtos. * from tabela_de_produtos;

select rownum, TP. * from tabela_de_produtos TP;

select TP. * from tabela_de_produtos TP where rownum <= 5;

select TP. * from tabela_de_produtos TP where rownum <= 5;

-- atividade:

select * from notas_fiscais where data_venda = to_date('2017-10-02','YYYY/MM/DD') and rownum <=10;

-- order by (ASC, DESC) ordem de filtragem

select * from tabela_de_produtos;

select * from tabela_de_produtos order by preco_de_lista;

select * from tabela_de_produtos order by preco_de_lista desc;

select * from tabela_de_produtos order by nome_do_produto;

select * from tabela_de_produtos order by embalagem, nome_do_produto;

select * from tabela_de_produtos order by embalagem desc, nome_do_produto;

select * from tabela_de_produtos order by embalagem, nome_do_produto desc;

-- atv

select * from tabela_de_produtos;

select * from tabela_de_produtos where nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limao';

select * from itens_notas_fiscais where codigo_do_produto ='1101035' order by quantidade desc;

-- agrupar críterios group by onde envolve soma, media... diferente de distinct

select * from tabela_de_clientes;

select cidade, idade from tabela_de_clientes order by cidade, idade;

select cidade, sum(idade) from tabela_de_clientes group by cidade order by cidade;

select cidade, sum(limite_de_credito), sum(idade) from tabela_de_clientes group by cidade;

select embalagem, max(preco_de_lista) from tabela_de_produtos group by embalagem;

select embalagem, nome_do_produto from tabela_de_produtos order by embalagem;

select embalagem, count(*) as quantidade from tabela_de_produtos where sabor = 'Laranja' group by embalagem order by embalagem;

-- atv

select * from tabela_de_produtos;

select * from tabela_de_produtos order by codigo_do_produto desc;

select * from itens_Notas_fiscais;

select count(*) as Vendas from itens_notas_fiscais where codigo_do_produto = '1101035' and quantidade = 99; 

-- having

select * from tabela_de_clientes;

select estado, sum(limite_de_credito) from tabela_de_clientes group by estado;

-- having vai buscar apenas o espado onde o limite de credito é maior q 900mil, não utilizando o where

select estado, sum(limite_de_credito) from tabela_de_clientes group by estado having sum(limite_de_credito) >= 900000;

select embalagem, max(preco_de_lista) as Maior_Preço, min(preco_de_lista) as menor_preço from tabela_de_produtos group by embalagem;

-- se eu quiser algo q seja maior q 10 reais

select nome_do_produto, max(preco_de_lista) as Maior_Preço, min(preco_de_lista) as menor_preço from tabela_de_produtos where preco_de_lista >= 10 group by nome_do_produto order by maior_preço;

select nome_do_produto, max(preco_de_lista) as "Maior preço",min(preco_de_lista) as "Menor Preço" from Tabela_de_produtos group by nome_do_produto having max(preco_de_lista) >= 17;

-- atv

select codigo_do_produto, sum(quantidade) from itens_notas_fiscais group by codigo_do_produto order by sum(quantidade) desc;

select codigo_do_produto, sum(quantidade) from itens_notas_fiscais group by codigo_do_produto having sum(quantidade) > 394000 order by sum(quantidade) desc;

--case when

select nome_do_produto, preco_de_lista,
(case when preco_de_lista >= 12 then 'Produto caro'
      when preco_de_lista >= 7 and preco_de_lista < 12 then 'Produto em conta'
      else 'Produto Barato'
      end) as Classificacao     
from tabela_de_produtos
where sabor = 'Manga';

-- usando order by

select nome_do_produto, preco_de_lista,
(case when preco_de_lista >= 12 then 'Produto caro'
      when preco_de_lista >= 7 and preco_de_lista < 12 then 'Produto em conta'
      else 'Produto Barato'
      end) as Classificacao     
from tabela_de_produtos
order by 
(case when preco_de_lista >= 12 then 'Produto caro'
      when preco_de_lista >= 7 and preco_de_lista < 12 then 'Produto em conta'
      else 'Produto Barato'
      end);
      
-- posso apenas colocar 'classificaca' pos order by que dara o mesmo resultado

-- atv

select nome,
(case when limite_de_credito >=150000 then 'Cliente Grande'
    when limite_de_credito < 150000 and limite_de_credito >= 110000 then 'Cliente Medio'
      else 'Cliente pequeno'
      end) as resultado
from tabela_de_clientes
order by (resultado);

-- inserindo join

select * from tabela_de_vendedores;

select * from notas_fiscais;

select MATRICULA, count(*) as NUMERO_DE_NOTAS from notas_fiscais
group by MATRICULA;


select nf.matricula 
, tv.nome, count(*) as NUMERO_DE_NOTAS
from 
notas_fiscais nf
inner join
tabela_de_vendedores tv
on nf.matricula = tv.matricula
group by nf.matricula, tv.nome;

-- left join que junta uma tabela esquerda pra direita, right join, da direita pra esquerda, full join junta tudo, e cross join uma analise geral


select distinct
TC.CPF as CPF_DO_CADASTRO,
TC.Nome as Nome_Cliente,
NF.CPF as CPF_DA_NOTA
from
tabela_de_clientes TC
inner join
notas_fiscais NF
ON TC.CPF = NF.CPF;

select count(*) from tabela_de_clientes;

INSERT INTO TABELA_DE_CLIENTES 
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, 
SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) 
VALUES ('23412632331', 'Juliana Silva', 'R. Tramandai', '', 'Bangu', 'Rio de Janeiro', 
'RJ', '23400000', TO_DATE('1989-02-04','YYYY-MM-DD'), 28, 'F', 180000.0000, 24500, 0);

select distinct
TC.CPF as CPF_DO_CADASTRO,
TC.Nome as Nome_Cliente,
NF.CPF as CPF_DA_NOTA
from
tabela_de_clientes TC
left join
notas_fiscais NF
ON TC.CPF = NF.CPF;

select distinct
TC.CPF as CPF_DO_CADASTRO,
TC.Nome as Nome_Cliente

from
tabela_de_clientes TC
left join
notas_fiscais NF
ON TC.CPF = NF.CPF
where NF.CPF is null;


select distinct
tv.nome as Nome_Vendedor,
tv.bairro as Bairro_vendedor,
tc.nome as Nome_cliente,
tc.bairro as Bairro_cliente
from
tabela_de_clientes tc
inner join
tabela_de_vendedores tv
on tv.bairro = tc.bairro;

-- acima o comando pega os vendedores q tem sede nos bairros com clientes, abaixo mostrara OS BAIRROS onde TEM cliente MAS NAO TEM VENDEDOR 

select distinct
tv.nome as Nome_Vendedor,
tv.bairro as Bairro_vendedor,
tc.nome as Nome_cliente,
tc.bairro as Bairro_cliente
from
tabela_de_clientes tc
left join
tabela_de_vendedores tv
on tv.bairro = tc.bairro;

-- abaixo mostra exatamente ao contrario, onde mostra os bairros dos vendedores onde NAO TEM CLIENTE

select distinct
tv.nome as Nome_Vendedor,
tv.bairro as Bairro_vendedor,
tc.nome as Nome_cliente,
tc.bairro as Bairro_cliente
from
tabela_de_clientes tc
right join
tabela_de_vendedores tv
on tv.bairro = tc.bairro;

-- Mostrando tudo em full join

select distinct
tv.nome as Nome_Vendedor,
tv.bairro as Bairro_vendedor,
tc.nome as Nome_cliente,
tc.bairro as Bairro_cliente
from
tabela_de_clientes tc
full join
tabela_de_vendedores tv
on tv.bairro = tc.bairro;

-- union

-- in

select distinct bairro from tabela_de_vendedores;

select * from tabela_de_clientes 
where bairro in ('Tijuca', 'Jardins','Copacabana', 'Santo Amaro');

-- mesmo resultado abaixo de forma diferente

select * from tabela_de_clientes where bairro in
(select distinct bairro from tabela_de_vendedores);

select distinct bairro from tabela_de_vendedores;

select distinct * from Tabela_de_Clientes where BAIRRO in(
'Tijuca',
'Jardins',
'Copacabana',
'Santo Amaro'
);

select * from tabela_de_clientes where bairro in
(select distinct bairro from tabela_de_vendedores);


select inf.codigo_do_produto, tp.nome_do_produto, sum(inf.quantidade)
from itens_notas_fiscais inf
inner join tabela_de_produtos tp
on inf.codigo_do_produto = tp.codigo_do_produto
group by inf.codigo_do_produto, tp.nome_do_produto having sum(inf.quantidade) > 394000
order by sum(inf.quantidade) desc;

select distinct sabor from tabela_de_produtos where codigo_do_produto in
(select inf.codigo_do_produto
from itens_notas_fiscais inf
inner join tabela_de_produtos tp
on inf.codigo_do_produto = tp.codigo_do_produto
group by inf.codigo_do_produto, tp.nome_do_produto having sum(inf.quantidade) > 394000);

-- deixando de usar having para usar (subquery)para listar preço acima de um valor

select embalagem, sum(preco_de_lista) as soma_preco
from tabela_de_produtos group by embalagem;

--abaixo usamos having

select embalagem, sum (preco_de_lista) as soma_preco
from tabela_de_produtos group by embalagem
having sum(preco_de_lista) >=80;

--abaixo sem usar having

select soma_embalagens.embalagem, soma_embalagens.soma_preco
from
(
select embalagem, sum(preco_de_lista) as soma_preco
from tabela_de_produtos group by embalagem
)soma_embalagens
where soma_embalagens.soma_preco >=80;

-- visao. views

create view vw_soma_embalagens as 
select embalagem, sum(preco_de_lista) as soma_preco
from tabela_de_produtos group by embalagem;

-- views cria uma tabela de visualização onde posso usar o ''vw_soma_de_embalagens'' como se fosse uma tabela criada

select embalagem, soma_preco from vw_soma_embalagens
where soma_preco >=80 ;

--views pode subistituir having

select * from tabela_de_produtos TP
inner join vw_soma_embalagens vw
on tp.embalagem = vw.embalagem
where vw.soma_preco >= 80;


-- funções tem funcoes pra string, datas, matematica e conversao de dados

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








