use vendas;

CREATE TABLE categorias (
      categoriaId integer not null identity primary key,
	  descricao varchar(30) null 
);

SELECT * FROM categorias;

INSERT INTO categorias (descricao) VALUES ('Alimentação');
INSERT INTO categorias (descricao) VALUES ('Notebook'), ('Tablets'), ('Roteadores'), ('Periféricos'), ('Adaga'), ('Abajur');