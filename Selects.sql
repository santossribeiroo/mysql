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
where nome like '%p%';

select * from cursos
where nome not like '%a%';

select * from cursos
where nome like '%PH%P%';

select carga from cursos
group by nome;

