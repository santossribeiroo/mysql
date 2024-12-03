Create table if not exists tbl_livro (
	id_livro smallint auto_increment primary key,
    nome_livro varchar(50) not null,
    ISBN varchar(30) not null,
    id_autor smallint not null,
    data_pub date not null,
    preco_livro decimal not null
);

show tables;

create table tbl_autores (
	id_autor smallint primary key,
    nome_autor varchar(50),
    sobrenome_autor varchar(60)
);

create table tbl_editoras(
	id_editora smallint primary key auto_increment,
    nome_editora varchar(50) not null
);

create table tbl_teste_incremento (
	codigo smallint primary key auto_increment,
    nome varchar(20) not null
) auto_increment = 15;

insert into tbl_teste_incremento (nome) values ('Ana');
insert into tbl_teste_incremento (nome) values ('Lucas');
insert into tbl_teste_incremento (nome) values ('Jordana');
insert into tbl_teste_incremento (nome) values ('Henrique');

-- select max(nome_tabela)
-- from tabela

select max(codigo)
from tbl_teste_incremento;

alter table tbl_teste_incremento auto_increment = 01;