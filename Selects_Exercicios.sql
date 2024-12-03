use cadastro;

select nome, carga, ano from cursos
order by nome; /* ordernar pelas colunas */

select nome, carga from cursos
where ano = '2016' /* = , < , > , <> , >= , <= , != */ 
order by nome;

select nome, carga, ano from cursos
where ano between 2014 and 2016
order by ano desc, nome asc;

select nome, descricao, ano from cursos
where ano in ( 2014 , 2016)
order by ano;

select * from cursos
where carga > 35 and totaulas < 30;

select * from cursos
where carga > 40 or totaulas < 30;

select * from cursos
where nome like '%p';

select * from cursos
where nome not like '%a';

select * from cursos
where nome like '%PH%P%';

select distinct nacionalidade from gafanhotos
order by nacionalidade;

select count(*) from cursos;

select count(*) from cursos 
where carga > 40;

select max(carga) from cursos        /* max, min */
where ano = '2016'
order by carga;

select sum(totaulas) from cursos    /* Soma dos valores*/
where ano = '2016';

select avg(totaulas) from cursos     /* Média dos valores */
where ano = '2016';


/* LISTA DE EXERCICIOS */

/*1) Uma lista com o nome de todos os gafanhotos Mulheres.*/
select * from gafanhotos
where sexo = 'F';

/*2) Uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015.*/
select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31';

/*3) Uma lista com o nome de todos os homens que trabalham como programadores.*/
select * from gafanhotos
where profissao = 'Programador' and sexo = 'M';

/*4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J.*/
select * from gafanhotos
where sexo = 'F' and nacionalidade = 'Brasil'  and nome like 'j%';

/*5) Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 Kg.*/
select * from gafanhotos
where nome like '%Silva%' and nacionalidade = 'Brasil' and peso < 100.00;

/*6) Qual é a maior altura entre gafanhotos Homens que moram no Brasil?*/
select max(altura) from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'M';

/*7) Qual é a média de peso dos gafanhotos cadastrados?*/
select avg(peso) from gafanhotos;

/*8) Qual é o menor peso entre os gafanhotos Mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000?*/
select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade <> 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

/*9) Quantas gafanhotos Mulheres tem mais de 1.90cm de altura?*/
select * from gafanhotos
where sexo = 'F' and altura > 1.90;