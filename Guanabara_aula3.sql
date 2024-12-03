create database cadastro
default character set utf8
default collate utf8_general_ci;

drop database cadastro;
use cadastro;
drop table pessoas;
describe pessoas;

create table pessoas (
	id int NOT NULL auto_increment,
	nome varchar(30) NOT NULL,
    profissao varchar(20) NOT NULL default '',
    nascimento date,
    sexo enum ( 'M' , 'F' ),
    peso decimal ( 5 , 2 ),
    altura decimal ( 3 , 2 ),
    nacionalidade varchar(20) default 'Brasil',
    primary key (id)
) default charset = utf8;

INSERT INTO pessoas VALUES
(DEFAULT , 'Rafael Santos Ribeiro', '', '2004-07-12', 'F', '52.2' , '1.74' , 'Brasil')
,(DEFAULT , 'Gasparzinho', '' ,  '2002-01-15', 'M', '82.3' , '1.60' , 'EUA')
,(DEFAULT , 'Osmar', '' , '1984-09-02', 'M', '90.0' , '1.98' , 'Iraque')
,(DEFAULT , 'Lucas Santos Ribeiro', '', '2001-11-04', 'M', '68.8' , '1.81' , 'Brasil')
,(DEFAULT , 'Jordana Andrelino', '',  '2004-07-12', 'F', '52.2' , '1.74' , 'Brasil');

SELECT * FROM gafanhotos;
SELECT * FROM cursos;

ALTER TABLE pessoas
ADD COLUMN profissao varchar(10) after nome;

ALTER TABLE pessoas
ADD codigo int first;

ALTER TABLE pessoas
DROP COLUMN profissao;

ALTER TABLE pessoas
modify column profissao varchar(20) not null default '';

ALTER TABLE pessoas
RENAME TO gafanhotos;

CREATE TABLE IF NOT EXISTS  cursos (
	nome varchar(30) NOT NULL UNIQUE,
    descricao text,
    carga int UNSIGNED,
    totaulas int UNSIGNED,
    ano year DEFAULT '2016'
) DEFAULT CHARSET = utf8;

ALTER TABLE cursos
add column idcurso int first;

describe cursos; 

ALTER TABLE cursos
add primary key (idcurso);

CREATE TABLE IF NOT EXISTS teste (
	id int,
    nome varchar(10),
    idade int
);

insert into teste value 
('1', 'Pedro', '22')
,('2', 'Lucas', '23')
,('3', 'Yago', '26');

SELECT * FROM teste;

drop table if exists teste;

INSERT INTO cursos values
('1' , 'HTML5' , 'Curso de HTML5' , '40' , '37' , '2014')
,('2' , 'Algoritmos' , 'Lógica de Programação' , '20' , '15' , '2014')
,('3' , 'Photoshop' , 'Dicas de Photoshop CC' , '10' , '8' , '2014')
,('4' , 'PHP' , 'Curso de PHP para iniciantes' , '40' , '20' , '2015')
,('5' , 'Java' , 'Introdução a Linguagem Java' , '40' , '29' , '2015')
,('6' , 'MySQL' , 'Banco de Dados MySQL' , '30' , '15' , '2016')
,('7' , 'Word' , 'Curso completo de Word' , '40' , '30' , '2016');