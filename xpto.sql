-- Criando o Banco de Dados
CREATE DATABASE XPTO_Pesquisas;
USE XPTO_Pesquisas;

-- Criação das Tabelas
CREATE TABLE Endereco (
    id_endereco INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(60) NOT NULL,
    estado VARCHAR(60) NOT NULL
);

CREATE TABLE Departamento (
    id_departamento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    filial VARCHAR(20) NOT NULL
);

CREATE TABLE Financa (
    id_financa INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fonte_financa VARCHAR(60) NOT NULL,
    quantia DECIMAL(10,2) NOT NULL CHECK (quantia > 0)
);

CREATE TABLE Projeto (
    id_projeto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL UNIQUE,
    id_financa INT UNSIGNED,
    custo DECIMAL(10,2) NOT NULL CHECK (custo > 0),
    FOREIGN KEY (id_financa) REFERENCES Financa(id_financa)
);

CREATE TABLE Pesquisador (
    id_pesquisador INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
    id_endereco INT UNSIGNED,
    id_departamento INT UNSIGNED,
    id_projeto INT UNSIGNED,
    valor_bolsa DECIMAL(10,2) NOT NULL CHECK (valor_bolsa > 0),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
);

-- Inserção de Dados na Tabela Endereco
INSERT INTO Endereco (cidade, estado)
VALUES ('Boa Vista', 'Roraima'),
       ('Palmas', 'Tocantins'),
       ('Porto Alegre', 'Rio Grande do Sul'),
       ('Macapa', 'Amapa'),
       ('Belem', 'Para'),
       ('Palmas', 'Tocantins'),
       ('Boa Vista', 'Roraima'),
       ('Florianopolis', 'Santa Catarina'),
       ('Porto Velho', 'Rondonia'),
       ('Rio Branco', 'Acre'),
       ('Cabo Frio', 'Rio de janeiro'),
       ('Campinas', 'Sao Paulo'),
       ('Guarulhos', 'Sao Paulo'),
       ('Belo Horizonte', 'Minas Gerais'),
       ('Sao Paulo', 'Sao Paulo');
       
-- Inserção de Dados na Tabela Departamento
INSERT INTO Departamento (nome, filial)
VALUES 
('DIDES', 'NORTE'),
('DIDES', 'SUL'),
('DIRUR', 'SUL'),
('DIMAC', 'NORTE'),
('DIMAC', 'SUL'),
('DINTE', 'SUDESTE'),
('DISOC', 'SUDESTE');

-- Inserção de Dados na Tabela Financa
INSERT INTO Financa (fonte_financa, quantia)
VALUES ('BID', 100000.00),
       ('BNDES', 30000.00),
       ('BID', 100000.00),
       ('BNDES', 200000.00),
       ('BNDES', 50000.00),
       ('BANERJ', 70000.00),
       ('BANESPA', 45000.00),
       ('BANESPA', 85000.00),
       ('BDMG', 120000.00);

-- Inserção de Dados na Tabela Projeto
INSERT INTO Projeto (nome, id_financa, custo)
VALUES 
('Acesso a Oportunidades', 1, 15000.00),
('Brasil em Desenvolvimento', 2, 19000.00),
('Emprego no Turismo', 3, 35000.00),
('Mapa das Organizacoes da Sociedade Civil', 4, 55000.00),
('Observatorio de Gestao do Conhecimento', 5, 20000.00),
('Atlas da Violencia', 6, 45000.00),
('Centro de Pesquisa em Ciencia, Tecnologia e Sociedade', 7, 25000.00),
('Retrato das Desigualdades de Genero e Raca', 8, 32000.00);

-- Inserção de Dados na Tabela Pesquisador
INSERT INTO Pesquisador (nome, status, id_endereco, id_departamento, id_projeto, valor_bolsa)
VALUES 
('Miguel Silva', 'Ativo', 1, 1, 1, 3100.00),
('Arthur Carvalho', 'Ativo', 2, 2, 2, 2500.00),
('Helena Sousa', 'Inativo', 3, 3, 3, 4000.00),
('Laura Pereira', 'Ativo', 4, 4, 4, 2500.00),
('Gabriel Luz', 'Ativo', 5, 5, 5, 3200.00),
('Samuel Santos', 'Inativo', 6, 6, 6, 2000.00),
('Maria Oliveira', 'Ativo', 7, 1, 7, 2500.00),
('Alice Rodrigues', 'Ativo', 8, 2, 8, 3100.00),
('Bernardo Alves', 'Ativo', 9, 3, 1, 2000.00),
('Theo Gomes', 'Inativo', 10, 4, 2, 2500.00),
('Ailton Santos', 'Ativo', 11, 5, 3, 3100.00),
('Ana Beatriz', 'Ativo', 12, 6, 4, 2100.00),
('Bruno Gomes', 'Inativo', 13, 7, 5, 3500.00),
('Leticia Rodrigues', 'Ativo', 14, 1, 6, 2500.00),
('Vinicius Silva', 'Ativo', 15, 2, 7, 2800.00);

-- Consultas para Verificar os Dados Inseridos
SELECT * FROM Endereco;
SELECT * FROM Departamento;
SELECT * FROM Financa;
SELECT * FROM Projeto;
SELECT * FROM Pesquisador;
