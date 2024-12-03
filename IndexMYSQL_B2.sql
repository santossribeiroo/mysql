use db_biblioteca;

show index from tbl_editoras;

select * from tbl_editoras;

insert into tbl_editoras (nome_editora) values ('Springer');

explain select * from tbl_editoras
where nome_editora = 'Springer';

create index idx_editora on tbl_editoras(nome_editora);

drop index idx_editora on tbl_editoras;