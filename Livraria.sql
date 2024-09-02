create database livraria;

create table livros (
 id_livro int NOT NULL AUTO_INCREMENT,
 titulo varchar(20),
 autor varchar(20),
 ano_publicacao int,
 preco float,
 quantidade_estoque int,
 primary key (id_livro) 

);

insert into livros (titulo, autor, ano_publicacao, preco, quantidade_estoque)
values 
('Introdução ao SQL', 'João Silva', 2015, 50.00, 10),
('Mastering SQL', 'Maria Souza', 2018, 120.00, 5),
('SQL para Iniciantes', 'Paulo Santos', 2020, 75.00, 8);



select * from livros;
select titulo, autor, preco from livros ;
select titulo, ano_publicacao from livros where ano_publicacao >= 2018;
select titulo, preco from livros where preco >= 60 and preco <= 100;
select titulo, quantidade_estoque from livros where quantidade_estoque < 10;

SET SQL_SAFE_UPDATES = 0;
update livros set preco = 80.00 where titulo = 'SQL para Iniciantes';
update livros set quantidade_estoque = 15 where titulo = 'Introdução ao SQL';
delete from livros where titulo = 'Mastering SQL';

select sum(preco) as preco_total from livros;
select max(preco) as preco_maior from livros;

