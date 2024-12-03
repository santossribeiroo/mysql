CREATE DATABASE db_biblioteca;

drop database db_Biblioteca;

USE db_Biblioteca;
CREATE TABLE IF NOT EXISTS tbl_livro (
id_livro SMALLINT  AUTO_INCREMENT PRIMARY KEY,
nome_livro VARCHAR(70) NOT NULL,
isbn13 CHAR(13),
isbn10 CHAR(10),
data_pub DATE NOT NULL,
preco_livro DECIMAL(6,2) NOT NULL
);

CREATE TABLE tbl_autores (
id_autor SMALLINT PRIMARY KEY,
nome_autor VARCHAR(50) NOT NULL,
sobrenome_autor VARCHAR(60) NOT NULL
);

CREATE TABLE tbl_categorias (
id_categoria SMALLINT PRIMARY KEY,
categoria VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_editoras (
id_editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
nome_editora VARCHAR(50) NOT NULL
);

select * from tbl_livro;
select * from tbl_categorias;

ALTER TABLE tbl_livro
DROP COLUMN id_autor;

ALTER TABLE tbl_livro
ADD  id_autor  SMALLINT NOT NULL;

ALTER TABLE tbl_livro
ADD CONSTRAINT fk_id_autor
FOREIGN KEY (id_autor)
REFERENCES tbl_autores (id_autor);

ALTER TABLE tbl_livro
ADD  id_editora  SMALLINT NOT NULL;

ALTER TABLE tbl_Livro
ADD CONSTRAINT fk_id_editora
FOREIGN KEY (id_editora)
REFERENCES tbl_editoras (id_editora);

ALTER TABLE tbl_livro
ADD  id_categoria  SMALLINT NOT NULL;

ALTER TABLE tbl_Livro
ADD CONSTRAINT fk_id_categoria
FOREIGN KEY (id_categoria)
REFERENCES tbl_categorias (id_categoria);

insert into tbl_editoras (nome_editora) values ('Prentice Hall');
insert into tbl_editoras (nome_editora) values ('O´Reilly');
insert into tbl_editoras (nome_editora) values ('Microsoft Press');
insert into tbl_editoras (nome_editora) values ('Wiley');
INSERT INTO tbl_editoras (Nome_Editora) VALUES ('McGraw-Hill Education');

insert into tbl_autores
values
(1, 'Daniel', 'Barret'),
(2, 'Gerald', 'Carter'),
(3, 'Mark', 'Sobell'),
(4, 'William', 'Stanek'),
(5, 'Richard', 'Blum'),
(6, 'Jostein', 'Gaarder'),
(7, 'Umberto', 'Eco'),
(8, 'Neil', 'De Grasse Tyson'),
(9, 'Stephen', 'Hawking'),
(10, 'Stephen', 'Jay Gould'),
(11, 'Charles', 'Darwin'),
(12, 'Alan', 'Turing'),
(13, 'Simon', 'Monk'),
(14, 'Paul', 'Scherz');

insert into tbl_categorias
values
(1, 'Tecnologia'),
(2, 'História'),
(3, 'Literatura'),
(4, 'Astronomia'),
(5, 'Botânica');

select * from tbl_livro;
select * from tbl_editoras;
select * from tbl_categorias;
select * from tbl_autores;


insert into tbl_Livro (nome_livro, isbn13, isbn10, data_pub, preco_livro, id_categoria, id_autor, id_editora)
values
('Linux Command Line and Shell Scripting','9781118983843', '111898384X', '20150109', 68.35, 1, 5, 4),
('SSH, the Secure Shell','9780596008956', '0596008953', '20050517', 58.30, 1, 1, 2),
('Using Samba','9780596002565', '0596002564', '20031221', 61.45, 1, 2, 2),
('Fedora and Red Hat Linux', '9780133477436', '0133477436', '20140110', 62.24, 1, 3, 1),
('Windows Server 2012 Inside Out','9780735666313', '0735666318', '20130125', 66.80, 1, 4, 3),
('Microsoft Exchange Server 2010','9780735640610', '0735640610', '20101201', 45.30, 1, 4, 3),
('Practical Electronics for Inventors', '9781259587542', '1259587541', '20160324', 67.80, 1, 13, 5);
