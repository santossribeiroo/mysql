
-- Operador WHERE
SELECT Nome_Livro, Data_Pub
FROM tbl_Livro
WHERE ID_Autor = 1;

SELECT ID_Autor, Nome_Autor
FROM tbl_autores
WHERE Sobrenome_Autor = 'Stanek';

SELECT Nome_Livro, Preco_Livro
FROM tbl_livro
WHERE ID_Editora = 3;


-- Operador AND, OR E NOT
SELECT * FROM tbl_Livro
WHERE ID_Livro > 2 AND ID_Autor < 3;

SELECT * FROM tbl_Livro
WHERE ID_Livro > 2 OR ID_Autor < 3;

SELECT * FROM tbl_Livro
WHERE ID_Livro > 2 AND NOT ID_Autor < 3;

-- Operadores IN e NOT
-- Filtragem usando lista de valores
select nome_livro, id_editora
from tbl_livro
where id_editora in (2,4);

select nome_livro, id_editora
from tbl_livro
where id_editora not in (1,2);

select nome_livro, id_editora
from tbl_livro
where id_editora in (
	select id_editora
    from tbl_editoras
    where nome_editora = 'Wiley' or nome_editora = 'Microsoft Press'
);

create table tbl_teste_incremento (
	id_teste smallint primary key,
    nome varchar(30)
);

insert into tbl_teste_incremento values 
('1' , 'Lucas')
,('2' ,'Jordana')
,('3' , 'Ana')
,('4' , 'Henrique')
,('5' , 'Rafael')
,('6' , 'Admilson');

select * from tbl_teste_incremento;

delete from tbl_teste_incremento
where nome = 'Lucas';

truncate table tbl_teste_incremento;

# ---------------------------------------------------------

select * from tbl_livro;

select 	id_livro as 'Código do Livro',
		nome_livro as 'Livros',
		id_autor as 'Código do Autor',
		preco_livro as 'Preço'
from tbl_livro;

# ---------------------------------------------------------

-- Funções de Agregação
select count(*) from tbl_autores;

select count(distinct id_autor) from tbl_livro;

select max(preco_Livro) from tbl_livro;

select min(preco_livro) from tbl_livro;

select avg(preco_livro) from tbl_livro;

select sum(preco_livro) from tbl_livro;

# ---------------------------------------------------------
create table clientes (
	id_cliente smallint,
    nome_cliente varchar(20),
    constraint primary key (id_cliente)
);

insert into clientes (id_cliente, nome_cliente)
values ('22' , 'Fábio');

insert into clientes (id_cliente, nome_cliente)
values ('34' , 'Alberto');

insert into clientes (id_cliente, nome_cliente)
values ('63' , 'Eric');

rename table clientes to meus_clientes;

select * from meus_clientes;

# ---------------------------------------------------------
-- Atualizar registros

update tbl_livro
set nome_livro = 'SSH, The Secure Shell'
where id_livro = 30;

select * from tbl_livro;

# -------------------------------------------------------------
-- Seleção de Intervalos
select * from tbl_livro
where data_pub between '20040517' and '20110517';

select 	nome_livro as 'Livro', 
		preco_livro as 'Preço'
from tbl_livro
where preco_livro between 40.00 and 60.00;

# -----------------------------------------------
-- LIKE and NOT LIKE

select * from tbl_livro
where nome_livro like 'F%';

select * from tbl_Livro
where nome_livro NOT LIKE 'S%';

select nome_livro
from tbl_livro
where nome_livro like '_i%';

# -------------------------------------------

-- REGEXP
-- [a-h] , [aeiou]       Negação = [^a-h], [^aeiou]
-- Ínicio da string = ^       Fim da string = $   Alternação = a|b|c|d

SELECT Nome_Livro
FROM tbl_Livro
WHERE Nome_Livro REGEXP '^[FS]';

SELECT Nome_Livro
FROM tbl_Livro
WHERE Nome_Livro REGEXP '^[^FS]';

SELECT Nome_Livro
FROM tbl_Livro
WHERE Nome_Livro REGEXP '[ng]$';

SELECT Nome_Livro
FROM tbl_Livro
WHERE Nome_Livro REGEXP '^[FS]|Mi';

# ==========================================================

-- Comando Default

ALTER TABLE tbl_autores
MODIFY COLUMN Sobrenome_Autor Varchar(60)
DEFAULT 'da Silva';

-- Retira o Default

ALTER TABLE tbl_autores
MODIFY COLUMN Sobrenome_Autor Varchar(60);

# =======================================================

-- GROUP BY

Create database db_vendas;
use db_vendas;

CREATE TABLE Vendas (
ID Smallint Primary Key,
Nome_Vendedor Varchar(20),
Quantidade Int,
Produto Varchar(20),
Cidade Varchar(20)
);

INSERT INTO Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade)
  VALUES
(10,'Jorge',1400,'Mouse','São Paulo'),
(12,'Tatiana',1220,'Teclado','São Paulo'),
(14,'Ana',1700,'Teclado','Rio de Janeiro'),
(15,'Rita',2120,'Webcam','Recife'),
(18,'Marcos',980,'Mouse','São Paulo'),
(19,'Carla',1120,'Webcam','Recife'),
(22,'Roberto',3145,'Mouse','São Paulo');

SELECT SUM(Quantidade) As TotalMouses
FROM Vendas
WHERE Produto = 'Mouse';

SELECT cidade, SUM(Quantidade) As TotalMouses
FROM Vendas
group by cidade;

SELECT Cidade, COUNT(*) As Total
FROM Vendas
GROUP BY Cidade;

SELECT Nome_Vendedor, SUM(Quantidade)
FROM Vendas
GROUP BY Nome_Vendedor;

# =======================================

-- HAVING
	
SELECT Cidade, SUM(Quantidade) As Total
FROM Vendas
GROUP BY Cidade
HAVING SUM(Quantidade) < 2500;

SELECT Cidade, SUM(Quantidade) As TotalTeclados
FROM Vendas
WHERE Produto = 'Teclado'
GROUP BY Cidade
HAVING SUM(Quantidade) < 1500;

# ========================================

-- VIEWS
use db_biblioteca;

create view vw_livrosAutores
as select tbl_livro.nome_livro as Livro,
tbl_autores.nome_autor as Autor
from tbl_livro
Inner Join tbl_autores
on tbl_livro.id_autor = tbl_autores.id_autor;

select *
from vw_livrosAutores
order by autor;

Alter view vw_livrosAutores as
select tbl_livro.nome_livro as Livro,
tbl_autores.nome_autor as Autor,
preco_livro as Valor
from tbl_livro
inner join tbl_autores
on tbl_livro.id_autor = tbl_autores.id_autor;

-- Exclusão de uma Visão
drop view vw_livrosAutores;

# =================================================

-- JOINS
select * from tbl_livro
inner join tbl_autores
on tbl_livro.id_autor = tbl_autores.id_autor;

SELECT tbl_Livro.Nome_Livro, tbl_Livro.isbn13, tbl_autores.Nome_Autor
FROM tbl_Livro
INNER JOIN tbl_autores
ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

SELECT livro.Nome_Livro AS Livros, editora.Nome_editora AS Editoras
FROM tbl_Livro AS livro
INNER JOIN tbl_editoras AS editora
ON livro.ID_editora = editora.ID_editora
WHERE editora.nome_editora LIKE 'M%';

SELECT livro.Nome_Livro AS 'Livro',
autor.Nome_autor AS 'Autor',
editora.nome_editora AS 'Editora',
livro.Preco_Livro AS 'Preço do Livro'
FROM tbl_Livro AS livro
INNER JOIN tbl_autores AS autor
ON livro.ID_autor = autor.ID_autor
INNER JOIN tbl_editoras AS editora
ON livro.ID_editora = editora.ID_editora
WHERE editora.Nome_Editora LIKE 'O%'
ORDER BY livro.Preco_Livro DESC;