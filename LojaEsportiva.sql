create database lojaEsportiva; 

create table Categoria(
categoria_id int unsigned auto_increment primary key,
nome_categoria varchar(40) not null unique
);

create table Produtos(
produtos_id int unsigned auto_increment primary key,
categoria_id int unsigned not null,
nome varchar(40) not null,
preço decimal(10,2) not null,
quantidade int not null check (quantidade > 0),
foreign key (categoria_id) references Categoria(categoria_id) 
);

ALTER TABLE Produtos
CHANGE COLUMN preço preco DECIMAL(10, 2) NOT NULL;

insert into Categoria(nome_categoria) 
values 
('Roupas Esportivas'),
('Equipamentos de Futebol'),
('Acessórios de Treino');

insert into Produtos(categoria_id, nome, preco, quantidade)
values
(1, 'Camisa de Futebol', 89.90, 100),
(2, 'Tênis de Corrida', 299.99, 50),
(3, 'Faixa de Cabeça', 25.00, 200);

select p.produtos_id, p.nome as nome_produto, p.preco, p.quantidade, c.nome_categoria 
from Produtos p 
inner join Categoria c on p.categoria_id = c.categoria_id;

select p.nome as nome_produto 
from Produtos p 
inner join Categoria c on p.categoria_id = c.categoria_id 
where c.nome_categoria = 'Roupas Esportivas';

select c.nome_categoria as nome_produto, p.quantidade
from Produtos p 
inner join Categoria c on p.categoria_id = c.categoria_id 
where p.quantidade > 50;

SET SQL_SAFE_UPDATES = 0;
update Produtos set preco = 279.99 where nome = 'Tênis de Corrida';

insert into Categoria(nome_categoria)
values
('Artigos Natação');

insert into Produtos(categoria_id, nome, preco, quantidade)
values
(LAST_INSERT_ID(),'Oculos de Nado', 120.00, 30);

delete from Produtos where nome = 'Faixa de Cabeça';






