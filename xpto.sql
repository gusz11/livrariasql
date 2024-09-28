create database XPTO_Pesquisas;

CREATE TABLE Endereco (
    id_endereco INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(60) NOT NULL,
    estado VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE Departamento (
    id_departamento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    filial VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Financa (
    id_financa INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fonte_financa VARCHAR(60) NOT NULL,
    quantia DECIMAL(10,2) NOT NULL CHECK (quantia > 0)
);

CREATE TABLE Projeto (
    id_projeto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL UNIQUE,
    id_financa INT,
    custo DECIMAL(10,2) NOT NULL CHECK (custo > 0),
    FOREIGN KEY (id_financa) REFERENCES Financa(id_financa)
);

CREATE TABLE Pesquisador (
    id_pesquisador INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
    id_endereco INT,
    id_departamento INT,
    id_projeto INT,
    valor_bolsa DECIMAL(10,2) NOT NULL CHECK (valor_bolsa > 0),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
);