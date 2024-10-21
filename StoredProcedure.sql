create database mercado;

create table Cliente (
	idCliente int auto_increment primary key,
    nome varchar(100),
    email varchar(100),
    dataRegistro date
);

DELIMITER //
create procedure HelloWorld()
begin
	select "Olá Mundo!!" as Mensagem;
    end //
DELIMITER ; 

call HelloWorld;

DELIMITER //
create procedure InserirCliente(
	in p_nome varchar(100),
    in p_email varchar(100),
    in p_dataRegistro date
)
begin
	insert into Cliente (nome, email, dataRegistro)
    values (p_nome, p_email, p_dataRegistro);
end //
DELIMITER ;

call InserirCliente('Gustavo Jesus', 'oi@.com', '2024-10-21');

select * from Cliente;

DELIMITER //
create procedure AtualizarCliente(
	in p_id int,
	in p_nome varchar(100),
    in p_email varchar(100),
    in p_dataRegistro date
)
begin
	update Cliente
    set
    nome = p_nome,
    email = p_email,
    dataRegistro = p_dataRegistro
    where
    idCliente = p_id;
end //
DELIMITER ;

call AtualizarCliente('1', 'Joao', 'Tchau@.com', '24-11-11');

DELIMITER //
create procedure BuscarCliente(
 in p_id int, 
 out p_nome varchar(100)
)
begin 
	select nome into p_nome  
    from Cliente 
    where
    idCliente = p_id;
end //
DELIMITER ;

set @nomeCliente = '';
call BuscarCliente(1, @nomeCliente);
select @nomeCliente;

DELIMITER //
create procedure ExcluirCliente(
 in p_id int
 )
 begin 
	delete from Cliente
    where idCliente = p_id;
    end //
DELIMITER ; 

call ExcluirCliente(1);

DELIMITER //
create procedure ContarCliente(
	out p_totalCliente int
    )
    begin
    select count(*) into p_totalCliente
    from Cliente;
    end //
 DELIMITER ;
 
 set @totalCliente = 0;
 call ContarCliente(@totalCLiente);
 select @totalCliente;
 
show procedure status;