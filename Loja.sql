create database loja;

create table Cliente(
	cliente_id int unsigned auto_increment primary key,
    nome varchar(100) not null, 
    email varchar(120) not null unique, 
    endereco varchar(150) not null, 
    data_nascimento date not null check (data_nascimento > '1900-01-01'), 
    status enum('ativo', 'inativo') not null default 'ativo' 
);

create table Pedido(
	pedido_id int unsigned auto_increment primary key,
    cliente_id int unsigned not null, 
    data_pedido date not null check (data_pedido > '1900-01-01'),
    valor_total decimal(10,2) not null default 0,
    status enum('pendente', 'processado', 'enviado', 'entregue') not null default 'pendente',
	foreign key (cliente_id) references Cliente (cliente_id) on delete cascade,
    index(cliente_id)
);

insert into Cliente(nome, email, endereco, data_nascimento, status)
values
	('João Silva', 'joao.silva@email.com', 'Rua A', '1985-06-16', 'ativo'),
    ('Maria Oliveira', 'maria.oliveira@email.com', 'Rua B', '1990-12-22', 'ativo'),
    ('Carlos Souza', 'carlos.souza@email.com', 'Rua C', '1978-03-30', 'inativo');

insert into Pedido(cliente_id, data_pedido, valor_total, status)
values 
	(4, '2024-09-10', 150.75, 'processado'),
	(5, '2024-09-11', 299.99, 'enviado'), 
	(6, '2024-09-12', 50.00, 'pendente');

select * from cliente;
select * from pedido;
select pedido_id, data_pedido, valor_total, status from pedido where cliente_id = 5;
select nome, status from cliente where status = 'ativo';
select pedido.pedido_id, pedido.data_pedido, pedido.valor_total, pedido.status, cliente.nome, cliente.email
from pedido 
inner join cliente on pedido.cliente_id = cliente.cliente_id where data_pedido between '2024-09-10' and '2024-09-11';
select cliente.nome, pedido.valor_total
from cliente 
inner join pedido on cliente.cliente_id = pedido.cliente_id where valor_total > 200.00;
select pedido.cliente_id, pedido.data_pedido from pedido order by pedido.data_pedido desc limit 3;

SET SQL_SAFE_UPDATES = 0;
update Cliente set status = 'ativo' where nome = 'Carlos Souza';
update Pedido set status = 'enviado' where cliente_id = 6;

